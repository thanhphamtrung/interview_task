


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

  @override
  String get reEnterPasswordHintText => 'Nhập Lại Mật Khẩu';

  @override
  String get userNameValidatorMessage => 'Tên Đăng Nhập Không Hợp Lệ!';

  @override
  String get passwordValidatorMessage => 'Mật Khẩu Phải Từ 6 Kí Tự!';

  @override
  String get userNameOrPasswordInValid => 'Tên Đăng Nhập Hoặc Mật Khẩu Không Đúng!';

  @override
  String get browseAll => 'XEM TOÀN BỘ';

  @override
  String get seeMore => 'XEM THÊM';

  @override
  String get whatNew => 'Có Gì Mới';
}
