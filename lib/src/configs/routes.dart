import 'package:flutter/material.dart';

import '../constants/global_constants.dart';
import '../screens/login/login_screen.dart';
import '../screens/register/register_screen.dart';
import '../screens/splash/splash_screen.dart';

Map<String, WidgetBuilder> buildRoutes() {
  return {
    RouteName.login: (context) => const LoginScreen(),
    RouteName.register: (context) => const RegisterScreen(),
    RouteName.splash: (context) => const SplashScreen(),
  };
}
