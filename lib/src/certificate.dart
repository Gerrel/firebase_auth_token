/// Google public certificate which holds multiple keys
class Certificate {
  /// Public keys
  final Map<String, String> keys;

  /// time of expiration after being fetched
  final int maxAge;

  /// time of when the keys have been fetched
  final DateTime fetched;

  /// datetime of max age expiration time
  DateTime get maxAgeDateTime => fetched.add(Duration(seconds: maxAge));

  /// constructor for public keys
  const Certificate({
    required this.keys,
    required this.maxAge,
    required this.fetched,
  });

  @override
  String toString() {
    return '''
    Certificate {
      fetched: $fetched,
      maxAge: $maxAge,
      keys: $keys,
    }
      ''';
  }
}
