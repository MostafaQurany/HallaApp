import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/features/auth/data/models/company_model.dart';
import 'package:halla/features/auth/data/models/social_media_model.dart';
import 'package:halla/features/auth/data/models/user_model.dart';

abstract interface class AuthDataSource {
  Future<UserModel> signInWithEmailPassword({
    required String email,
    required String password,
  });
  Future<String> signInWithPhone({
    required String phoneNumber,
  });

  Future<UserModel> linkPhoneWithEmail({
    required String smsCode,
    required String verificationId,
  });
}

class AuthDataSourceImpl implements AuthDataSource {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserModel> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel(
        id: credential.user!.uid,
        email: email,
        company: CompanyModel(),
        socialMedia: SocialMediaModel(),
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
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          
        },
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
        company: CompanyModel(),
        socialMedia: SocialMediaModel(),
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
}
