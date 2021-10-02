import 'app_localizations.dart';

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get login => 'ĐĂNG NHẬP';

  @override
  String get register => 'ĐĂNG XUẤT';

  @override
  String get userNameHintText => 'Tên Đăng Nhập';

  @override
  String get passwordHintText => 'Mật Khẩu';
}
