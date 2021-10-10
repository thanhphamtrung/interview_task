


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

  @override
  String get userNameValidatorMessage => 'User Name Is Invalid!';

  @override
  String get passwordValidatorMessage => 'Password Must Have 6 Or More Characters!';

  @override
  String get userNameOrPasswordInValid => 'User Name Or Password Is Not Correct!';

  @override
  String get browseAll => 'BROWSE ALL';

  @override
  String get seeMore => 'SEE MORE';

  @override
  String get whatNew => 'WHAT\'S NEW TODAY';
}
