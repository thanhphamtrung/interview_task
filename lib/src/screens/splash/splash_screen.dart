import 'package:flutter/material.dart';

import '../../constants/global_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.login);
                },
                child: const Text('Splash Screen'))));
  }
}
