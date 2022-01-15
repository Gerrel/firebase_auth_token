import 'package:firebase_auth_token/src/repository.dart';
import 'package:test/test.dart';

void main() {
  test('should be able to get public key', () async {
    const repo = Repository();
    final cert = await repo.getPublicKeys();
    final now = DateTime.now();
    expect(cert.maxAge, greaterThan(0));
    expect(
      cert.fetched.millisecondsSinceEpoch,
      lessThanOrEqualTo(now.millisecondsSinceEpoch),
    );
    expect(
      cert.maxAgeDateTime.millisecondsSinceEpoch,
      greaterThan(now.millisecondsSinceEpoch),
    );
    expect(cert.keys, hasLength(2));
    for (final element in cert.keys.values) {
      expect(element.contains('CERTIFICATE'), isTrue);
    }
  });
}
