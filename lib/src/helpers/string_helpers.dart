class StringHelper {
  static final StringHelper _singleton = StringHelper._internal();

  factory StringHelper() {
    return _singleton;
  }

  StringHelper._internal();

  bool isNullOrEmpty(String? str) {
    return str == null || str.isEmpty;
  }
}
