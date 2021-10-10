import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'src/app.dart';
import 'src/models/user/user_credential.dart';
import 'src/services/authen_service.dart/authen_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserCredentialAdapter());
  var box = await Hive.openBox('app-local-db');
  if (!box.containsKey('user-credential')) {
    var seedUsers = await AuthenService().getSeedCredentialData();
    await box.put('user-credential', seedUsers);
  }
  await box.close();
  runApp(const App());
}
