import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/user/user_credential.dart';

class AuthenService {
  Future<List> readCredentialFromJson(String jsonUrl) async {
    var response = await rootBundle.loadString(jsonUrl);
    var data = json.decode(response);
    return data as List;
  }

  Future<List<UserCredential>> getSeedCredentialData() async {
    List data =
        await readCredentialFromJson('assets/config/user_credential.json');
    var userCredentials = <UserCredential>[];
    for (var element in data) {
      userCredentials
          .add(UserCredential.fromJson(element as Map<String, dynamic>));
    }
    return userCredentials;
  }

  Future<List> getCredentialData() async {
    try {
      var box = await Hive.openBox('app-local-db');
      var users = await box.get('user-credential');
      return users as List;
    } on Exception catch (e) {
      print(e);
    }
    return [];
  }

  Future<bool> addNewCredentialData(List users) async {
    try {
      var box = await Hive.openBox('app-local-db');
      await box.put('user-credential', users);
      return true;
    } on Exception catch (e) {
      print(e);
    }
    return false;
  }
}
