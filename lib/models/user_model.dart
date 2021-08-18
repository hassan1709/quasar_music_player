class UserModel {
  late String _userId;
  late String _email;
  late String _username;

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  UserModel();

  UserModel.fromMap(Map<String, dynamic> mapData) {
    try {
      this._userId = mapData['userId'];
      this._email = mapData['email'];
      this._username = mapData['username'];
    } catch (e) {
      throw e;
    }
  }

  Map<String, dynamic> toMap(UserModel user) {
    Map<String, dynamic> data = Map<String, dynamic>();

    data['userId'] = user._userId;
    data['email'] = user._email;
    data['username'] = user._username;

    return data;
  }
}
