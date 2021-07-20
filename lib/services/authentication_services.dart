import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:quasar_music_player/utilities/authentication_exception.dart';

class AuthenticationServices {
  Future<bool> signUp(String username, String email, String password) async {
    try {
      SignUpResult result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: CognitoSignUpOptions(
          userAttributes: {'email': email},
        ),
      );

      return result.isSignUpComplete;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<bool> confirmSignUp(String email, String confirmationCode) async {
    try {
      SignUpResult result = await Amplify.Auth.confirmSignUp(
        username: email,
        confirmationCode: confirmationCode,
      );

      return result.isSignUpComplete;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<bool> signIn(String email, String password) async {
    try {
      SignInResult result = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );

      return result.isSignedIn;
    } on InvalidParameterException {
      throw AuthenticationException.invalidParameters();
    } on UserNotConfirmedException {
      throw AuthenticationException.userNotConfirmed();
    } on UserNotFoundException {
      throw AuthenticationException.userNotFound();
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<void> signOut() async {
    try {
      await Amplify.Auth.signOut();
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<AuthUser?> getCurrentUser() async {
    try {
      return await Amplify.Auth.getCurrentUser();
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<bool> fetchSession() async {
    try {
      var result = await Amplify.Auth.fetchAuthSession(
        options: CognitoSessionOptions(getAWSCredentials: true),
      );

      return result.isSignedIn;
    } catch (e) {
      throw (e);
    }
  }
}
