import 'dart:async';
import 'dart:math';

import 'package:firebase_auth_token/src/certificate.dart';
import 'package:firebase_auth_token/src/repository.dart';
import 'package:synchronized/synchronized.dart';

/// Class which manages the cached public keys
class Service {
  final Repository _repository;
  final _lock = Lock();

  Certificate? _cachedPublicKey;
  Timer? _updateTimer;

  /// Constructor which takes a repository reference
  Service(this._repository);

  /// Get the (cached) public keys of Firebase Auth
  Future<Certificate> getPublicKeys() async {
    final key = _cachedPublicKey;
    if (key != null) {
      if (_updateTimer?.isActive != true) {
        _cachedPublicKey = null;
      } else {
        return key;
      }
    }
    final result = await _lock.synchronized(() async {
      final key = _cachedPublicKey;
      if (key != null) {
        return key;
      }

      final cert = await _repository.getPublicKeys();
      _startUpdateTimer(cert);
      _cachedPublicKey = cert;
      return cert;
    });
    return result;
  }

  void _startUpdateTimer(Certificate cert) {
    _updateTimer?.cancel();
    _updateTimer = Timer(Duration(seconds: max(cert.maxAge, 1)), () {
      _cachedPublicKey = null;
      getPublicKeys();
    });
  }

  /// Dispose resources in the class
  void dispose() {
    _updateTimer?.cancel();
  }
}
