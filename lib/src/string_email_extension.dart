/// Extension which provides utils for email strings
extension Email on String {
  /// Get the first part (before '@') of a email.
  /// If the string does not contain '@' the whole string is returned
  String withoutEmailProvider() {
    final at = indexOf('@');
    if (at <= 0 || at == length - 1) {
      return this;
    }
    return substring(0, at);
  }
}
