


import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get login => 'LOGIN';

  @override
  String get register => 'REGISTER';

  @override
  String get userNameHintText => 'User Name';

  @override
  String get passwordHintText => 'Password';

  @override
  String get reEnterPasswordHintText => 'Re-Enter Password';
}
