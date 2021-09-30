class UserCredential {
  UserCredential({
    required this.username,
    required this.password,
  });
  late final String username;
  late final String password;

  UserCredential.fromJson(Map<String, dynamic> json) {
    username = json['username'] as String;
    password = json['password'] as String;
  }

  Map<String, dynamic> toJson() {
    var _data = <String, dynamic>{};
    _data['username'] = username;
    _data['password'] = password;
    return _data;
  }
}
