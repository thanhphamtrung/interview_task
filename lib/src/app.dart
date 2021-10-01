import 'package:flutter/material.dart';

import 'configs/routes.dart';
import 'screens/splash/splash_screen.dart';
import 'styles/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.getAppTheme(),
        routes: buildRoutes(),
        home: const SplashScreen());
  }
}
