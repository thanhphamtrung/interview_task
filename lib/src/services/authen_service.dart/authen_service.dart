import 'dart:convert';

import 'package:flutter/services.dart';

import '../../models/user/user_credential.dart';

class AuthenService {
  Future<List> readCredentialFromJson(String jsonUrl) async {
    var response = await rootBundle.loadString(jsonUrl);
    var data = json.decode(response);
    return data as List;
  }

  Future<List<UserCredential>> getCredentialData() async {
    List data =
        await readCredentialFromJson('assets/config/user_credential.json');
    var userCredentials = <UserCredential>[];
    if (data.runtimeType == List) {
      for (var element in data) {
        userCredentials
            .add(UserCredential.fromJson(element as Map<String, dynamic>));
      }
    }
    return userCredentials;
  }
}
