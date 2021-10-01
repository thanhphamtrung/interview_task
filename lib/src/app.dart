import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'configs/routes.dart';
import 'screens/splash/splash_screen.dart';
import 'services/app_localization/app_localizations.dart';
import 'styles/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.getAppTheme(),
        localizationsDelegates: const [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('vi', ''), // Spanish, no country code
        ],
        routes: buildRoutes(),
        home: const SplashScreen());
  }
}
