import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/core/common/data/models/company_model.dart';
import 'package:halla/core/common/data/models/social_media_model.dart';
import 'package:halla/core/common/data/models/user_model.dart';

abstract interface class AuthDataSource {
  // sign in
  Future<UserModel> signInWithEmailPassword({
    required String email,
    required String password,
    required String pinCode,
  });
  Future<String> signInWithPhone({
    required String phoneNumber,
  });
  Future<UserModel> linkPhoneWithEmail({
    required String smsCode,
    required String verificationId,
  });
  // login
  Future<UserModel> logInWithEmailPassword({
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
  Future<UserModel> googleLogIn();

  Future<void> linkWithEmailPassword({
    required UserModel user,
  });
}

class AuthDataSourceImpl implements AuthDataSource {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserModel> signInWithEmailPassword({
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
      return UserModel(
        id: credential.user!.uid,
        email: email,
        pinCode: pinCode,
        nfcList: [],
        companyModel: CompanyModel(),
        socialMediaModel: SocialMediaModel(),
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
  Future<UserModel> linkPhoneWithEmail({
    required String smsCode,
    required String verificationId,
  }) async {
    try {
      final PhoneAuthCredential phoneAuthCredential =
          PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      final UserCredential credential = await firebaseAuth.currentUser!
          .linkWithCredential(phoneAuthCredential);
      return UserModel(
        id: credential.user!.uid,
        email: credential.user!.email.toString(),
        primePhone: credential.user!.phoneNumber.toString(),
        nfcList: [],
        companyModel: CompanyModel(),
        socialMediaModel: SocialMediaModel(),
      );
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
  Future<UserModel> logInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel(
        id: credential.user!.uid,
        email: email,
        nfcList: [],
        companyModel: CompanyModel(),
        socialMediaModel: SocialMediaModel(),
      );
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  // social
  @override
  Future<UserModel> googleLogIn() async {
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
      return UserModel(
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
        fullName: userCredential.user!.displayName ?? '',
        primePhone: userCredential.user!.phoneNumber ?? '',
        nfcList: [],
        companyModel: CompanyModel(),
        socialMediaModel: SocialMediaModel(),
      );
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> linkWithEmailPassword({required UserModel user}) async {
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
  Future<String> logInWithPhone(
      {required String smsCode, required String verificationId}) async {
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
