import 'package:firebase_auth_token/src/sip.dart';
import 'package:test/test.dart';

void main() {
  test('should be able to get proper toString value', () {
    expect('${Sip.anonymous}', equals('anonymous'));
    expect('${Sip.google}', equals('google.com'));
  });

  test('should be able to get provider references', () {
    expect(
      Sip.fromString('anonymous'),
      equals(Sip.anonymous),
    );

    expect(
      Sip.fromString('apple.com'),
      equals(Sip.apple),
    );

    expect(
      Sip.fromString('custom'),
      equals(Sip.custom),
    );

    expect(
      Sip.fromString('facebook.com'),
      equals(Sip.facebook),
    );

    expect(
      Sip.fromString('github.com'),
      equals(Sip.github),
    );

    expect(
      Sip.fromString('google.com'),
      equals(Sip.google),
    );

    expect(
      Sip.fromString('password'),
      equals(Sip.password),
    );

    expect(
      Sip.fromString('phone'),
      equals(Sip.phone),
    );

    expect(
      Sip.fromString('twitter.com'),
      equals(Sip.twitter),
    );

    try {
      Sip.fromString('unknown');
      fail('should throw exception');
    } catch (_) {}
  });
}
