import 'package:hive/hive.dart';

part 'user_credential.g.dart';

@HiveType(typeId: 0)
class UserCredential extends HiveObject {
  UserCredential({
    required this.username,
    required this.password,
  });
  @HiveField(0)
  late final String username;
  @HiveField(1)
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
