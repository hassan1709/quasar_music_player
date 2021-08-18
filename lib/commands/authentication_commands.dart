import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import 'package:email_auth/email_auth.dart';
import '../utilities/authentication_exception.dart';
import 'base_command.dart';

class AuthenticationCommands extends BaseCommand {
  final FirebaseAuth _firebaseAuth;
  final _userRef = FirebaseFirestore.instance.collection('users');
  bool _authenticationIsVerified = false;
  Stream<User?> get userStateChanges => _firebaseAuth.userChanges();
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  User? get currentUser => _firebaseAuth.currentUser;
  bool get authenticationIsVerified => _authenticationIsVerified;

  AuthenticationCommands(this._firebaseAuth);

  Future<bool> signUp(String username, String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await addUserToDB(currentUser!.uid, username, email);

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password')
        throw AuthenticationException.weakPassword();
      else if (e.code == 'email-already-in-use')
        throw AuthenticationException.emailInUse();
      else
        throw AuthenticationException.unknownException();
    } catch (e) {
      throw e;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await signOut();
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      _authenticationIsVerified = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found')
        throw AuthenticationException.userNotFound();
      else if (e.code == 'wrong-password')
        throw AuthenticationException.invalidPasswordException();
      else
        throw AuthenticationException.unknownException();
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw e;
    }
  }

  Future<bool> sendOTP(String email) async {
    EmailAuth.sessionName = email;
    return await EmailAuth.sendOtp(receiverMail: email);
  }

  bool verifyEmail(String email, String otp) {
    if (EmailAuth.validate(receiverMail: email, userOTP: otp)) {
      _authenticationIsVerified = true;

      return true;
    }
    return false;
  }

  Future<void> addUserToDB(String userId, String name, String email) async {
    try {
      userModel.userId = userId;
      userModel.username = name;
      userModel.email = email;

      await _userRef.doc(userId).set(userModel.toMap(userModel));
    } catch (e) {
      throw e;
    }
  }

  Future<void> getUserFromDB(String userId) async {
    try {
      final DocumentSnapshot doc = await _userRef.doc(userId).get();

      userModel = UserModel.fromMap(doc.data() as Map<String, dynamic>);
    } catch (e) {
      throw e;
    }
  }

  Future<void> deleteUserFromDB(String userId) async {
    try {
      await _userRef.doc(userId).delete();
      userModel.userId = '';
      userModel.email = '';
      userModel.username = '';
    } catch (e) {
      throw e;
    }
  }
}
