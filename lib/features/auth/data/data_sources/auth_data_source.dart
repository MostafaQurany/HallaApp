import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:halla/core/common/domain/entities/company.dart';
import 'package:halla/core/common/domain/entities/social_media.dart';
import 'package:halla/core/common/domain/entities/user.dart' as user;
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';

abstract interface class AuthDataSource {
  // sign in
  Future<user.User> signInWithEmailPassword({
    required String email,
    required String password,
    required String pinCode,
  });

  Future<String> signInWithPhone({
    required String phoneNumber,
  });

  Future<PhoneAuthCredential> getPhoneAuthCredential({
    required String smsCode,
    required String verificationId,
  });

  Future<void> linkPhoneWithEmail({
    required PhoneAuthCredential phoneAuthCredential,
  });

  // login
  Future<user.User> logInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<String> logInWithPhone({
    required String smsCode,
    required String verificationId,
  });

  Future<void> forgetPassword({
    required String email,
  });

  // social
  Future<user.User> googleLogIn();

  Future<void> linkWithEmailPassword({
    required user.User user,
  });
}

class AuthDataSourceImpl implements AuthDataSource {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<user.User> signInWithEmailPassword({
    required String email,
    required String password,
    required String pinCode,
  }) async {
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user.User(
        id: credential.user!.uid,
        email: email,
        pinCode: pinCode,
        fullName: '',
        primePhone: '',
        dateOfBirth: '',
        nationality: '',
        imageUrl: '',
        phones: [],
        socialMedia: SocialMedia(),
        company: Company(),
      );
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> signInWithPhone({
    required String phoneNumber,
  }) async {
    try {
      final Completer<String> completer = Completer<String>();
      int? forceResendingToken;
      String? verificationId;
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: _phoneHandler(phoneNumber),
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
        verificationFailed: (FirebaseAuthException error) {
          throw ServerException(error.message.toString());
        },
        codeSent: (verifId, forceToken) {
          forceResendingToken = forceToken;
          verificationId = verifId;
          completer.complete(verificationId);
        },
        codeAutoRetrievalTimeout: (verifId) {
          verificationId = verifId;
          completer.complete(verificationId);
        },
        forceResendingToken: forceResendingToken,
      );
      return await completer.future;
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> linkPhoneWithEmail({
    required PhoneAuthCredential phoneAuthCredential,
  }) async {
    try {
      await firebaseAuth.currentUser!.linkWithCredential(phoneAuthCredential);
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<PhoneAuthCredential> getPhoneAuthCredential({
    required String smsCode,
    required String verificationId,
  }) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      return credential;
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  String _phoneHandler(String phone) {
    if (phone[0] == '0' && phone[1] == '1') {
      return "+2$phone";
    } else {
      return phone;
    }
  }

  // login
  @override
  Future<user.User> logInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user.User(
        id: credential.user!.uid,
        email: email,
        pinCode: '',
        fullName: '',
        primePhone: '',
        dateOfBirth: '',
        nationality: '',
        imageUrl: '',
        phones: [],
        socialMedia: SocialMedia(),
        company: Company(),
      );
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  // social
  @override
  Future<user.User> googleLogIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      return user.User(
        id: userCredential.user!.uid,
        email: userCredential.user!.email ?? '',
        pinCode: AppConstants.generatePinCode(),
        fullName: userCredential.user?.displayName ?? '',
        primePhone: userCredential.user?.phoneNumber ?? '',
        dateOfBirth: '',
        nationality: '',
        imageUrl: '',
        phones: [],
        socialMedia: SocialMedia(),
        company: Company(),
      );
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> linkWithEmailPassword({required user.User user}) async {
    try {
      final AuthCredential passwordCredential = EmailAuthProvider.credential(
          email: user.email, password: user.pinCode);
      await firebaseAuth.currentUser!.linkWithCredential(passwordCredential);
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> logInWithPhone({
    required String smsCode,
    required String verificationId,
  }) async {
    try {
      final PhoneAuthCredential phoneAuthCredential =
          PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(phoneAuthCredential);

      return userCredential.user!.uid;
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> forgetPassword({required String email}) async {
    try {
      return await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
