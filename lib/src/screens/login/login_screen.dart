import 'package:flutter/material.dart';

import '../../services/app_localization/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(AppLocalizations.of(context)!.login),
      ),
    );
  }
}
