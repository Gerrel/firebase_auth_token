import 'dart:convert';

import 'package:firebase_auth_token/src/certificate.dart';
import 'package:http/http.dart' as http;

/// Stateless class to do data retieval operations
class Repository {
  static final _maxAgeRegex = RegExp(r'max-age=(\d+)');
  static final _publicKeyUrl = Uri.parse(
    'https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com',
  );

  /// Constructor for repo class
  const Repository();

  /// Get the public keys of Firebase Auth
  Future<Certificate> getPublicKeys() async {
    final response = await http.get(_publicKeyUrl);
    final data = (json.decode(response.body) as Map<String, dynamic>)
        .cast<String, String>();
    final cacheControlHeader = response.headers['cache-control'];
    if (cacheControlHeader == null) {
      throw Exception(
        'public key request does not have a cache-control header',
      );
    }

    final maxAgeMatch = _maxAgeRegex.firstMatch(cacheControlHeader);
    if (maxAgeMatch == null) {
      throw Exception('unable to extract max-age from cache-control header');
    }

    final maxAge = int.parse(maxAgeMatch.group(1)!);
    return Certificate(
      keys: data,
      fetched: DateTime.now(),
      maxAge: maxAge,
    );
  }
}
