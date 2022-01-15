import 'package:firebase_auth_token/src/certificate.dart';
import 'package:test/test.dart';

void main() {
  test('should be able to construct', () {
    final now = DateTime.now();
    final cert = Certificate(
      keys: {'test': 'value'},
      maxAge: 20,
      fetched: now,
    );
    expect(cert.keys, equals({'test': 'value'}));
    expect(cert.maxAge, equals(20));
    expect(cert.fetched, equals(now));
    expect(cert.maxAgeDateTime.isAfter(now), isTrue);

    expect('$cert'.trim(), startsWith('Certificate {'));
  });
}
