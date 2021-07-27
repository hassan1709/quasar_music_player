import 'base_command.dart';

class AuthenticationCommands extends BaseCommand {
  // static final AuthenticationCommands _authenticationCommands =
  //     AuthenticationCommands._internal();
  // factory AuthenticationCommands() => _authenticationCommands;
  // AuthenticationCommands._internal();

  Future<void> getCurrentUser() async {
    try {
      var currentUser = await authenticationServices.getCurrentUser();
      if (currentUser != null) {
        user.id = currentUser.userId;
        user.name = currentUser.username;
        user.email = currentUser.username;
        user.isAuthenticated = true;
        return;
      }

      user.isAuthenticated = false;
    } catch (e) {
      user.isAuthenticated = false;
      throw e;
    }
  }

  Future<bool> signUp(String username, String email, String password) async {
    try {
      bool result =
          await authenticationServices.signUp(username, email, password);

      if (result) {
        user.name = username;
        user.email = email;
        user.password = password;
      }
      return result;
    } catch (e) {
      throw e;
    }
  }

  Future<void> confirmSignUp(String confirmationCode) async {
    try {
      bool isSignUpComplete = await authenticationServices.confirmSignUp(
          user.email, confirmationCode);

      if (isSignUpComplete) await signIn(user.email, user.password);
    } catch (e) {
      throw e;
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await signOut();
      user.isAuthenticated =
          await authenticationServices.signIn(email, password);
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      user.isAuthenticated = false;
      await authenticationServices.signOut();
    } catch (e) {
      throw e;
    }
  }

  Future<void> fetchSession() async {
    try {
      user.isAuthenticated = await authenticationServices.fetchSession();
    } catch (e) {
      throw e;
    }
  }
}
