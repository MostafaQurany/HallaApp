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
        fullName: '',
        primePhone: '',
        dateOfBirth: '',
        nationality: '',
        socialMedia: SocialMediaModel(
          facebook: '',
          instagram: '',
          linkedin: '',
          twitter: '',
        ),
        company: CompanyModel(
          name: '',
          phoneNumber: '',
          website: '',
          position: '',
        ),
      );
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
