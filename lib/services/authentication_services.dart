class AuthenticationServices {
  Future<bool> signUp(String username, String email, String password) async {
    try {
      return false;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<bool> confirmSignUp(String email, String confirmationCode) async {
    try {
      return false;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<bool> signIn(String email, String password) async {
    try {
      return false;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<void> signOut() async {
    try {} catch (e) {
      print(e);
      throw (e);
    }
  }
}
