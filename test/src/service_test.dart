import 'dart:async';

import 'package:firebase_auth_token/src/certificate.dart';
import 'package:firebase_auth_token/src/repository.dart';
import 'package:firebase_auth_token/src/service.dart';
import 'package:test/test.dart';

class TestRepository implements Repository {
  int callCount = 0;
  @override
  Future<Certificate> getPublicKeys() async {
    callCount++;
    await Future.delayed(const Duration(milliseconds: 300), () {});
    return Certificate(
      keys: {'test': '$callCount'},
      maxAge: 5,
      fetched: DateTime.now(),
    );
  }
}

void main() {
  test('should be able to get public key synchronized', () async {
    final repo = TestRepository();
    final service = Service(repo);
    unawaited(service.getPublicKeys());
    await Future.delayed(const Duration(milliseconds: 50), () {});
    unawaited(service.getPublicKeys());
    await Future.delayed(const Duration(milliseconds: 100), () {});
    unawaited(service.getPublicKeys());
    await Future.delayed(const Duration(milliseconds: 200), () {});
    unawaited(service.getPublicKeys());
    await Future.delayed(const Duration(milliseconds: 50), () {});
    unawaited(service.getPublicKeys());
    await Future.delayed(const Duration(milliseconds: 300), () {});
    expect(repo.callCount, equals(1));
    service.dispose();
  });

  test('should be updating the key', () async {
    final repo = TestRepository();
    final service = Service(repo);
    final cert1 = await service.getPublicKeys();
    expect(cert1.keys['test'], equals('1'));
    await Future.delayed(const Duration(seconds: 6), () {});
    final cert2 = await service.getPublicKeys();
    expect(cert2.keys['test'], equals('2'));
    service.dispose();
  });

  test('should get new keys after disposal', () async {
    final repo = TestRepository();
    final service = Service(repo);
    final cert1 = await service.getPublicKeys();
    expect(cert1.keys['test'], equals('1'));
    service.dispose();
    final cert2 = await service.getPublicKeys();
    expect(cert2.keys['test'], equals('2'));
    service.dispose();
  });
}
