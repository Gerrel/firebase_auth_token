/// Class for statically typed sign in provider references
class Sip {
  /// The id of the sign in provider
  final String rawValue;

  const Sip._(this.rawValue);

  /// User authenticated with anonymous provider
  static const anonymous = Sip._('anonymous');

  /// User authenticated with apple provider
  static const apple = Sip._('apple.com');

  /// User authenticated with custom provider
  static const custom = Sip._('custom');

  /// User authenticated with facebook provider
  static const facebook = Sip._('facebook.com');

  /// User authenticated with github provider
  static const github = Sip._('github.com');

  /// User authenticated with google provider
  static const google = Sip._('google.com');

  /// User authenticated with password provider
  static const password = Sip._('password');

  /// User authenticated with phone provider
  static const phone = Sip._('phone');

  /// User authenticated with twitter provider
  static const twitter = Sip._('twitter.com');

  static const _all = [
    anonymous,
    apple,
    custom,
    facebook,
    github,
    google,
    password,
    phone,
    twitter
  ];

  /// Get sign in provider from provider id
  /// Will throw error when provider does not match
  static Sip fromString(String provider) {
    return _all.firstWhere((element) => element.rawValue == provider);
  }

  @override
  String toString() {
    return rawValue;
  }
}
