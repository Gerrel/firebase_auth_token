import 'package:firebase_auth_token/src/auth_user.dart';
import 'package:firebase_auth_token/src/repository.dart';
import 'package:firebase_auth_token/src/service.dart';
import 'package:jose/jose.dart';

export 'package:firebase_auth_token/src/auth_user.dart';

/// Firebase Auth Token class for verifying id tokens
/// by providing the unique project id
class FirebaseAuthToken {
  final Service _service = Service(const Repository());

  /// Must be your Firebase project ID, the unique identifier for your Firebase project,
  /// which can be found in the URL of that project's console.
  final String projectId;

  /// Create instance for firebase id token check by projectId
  FirebaseAuthToken({required this.projectId});

  /// Verify and extract the data within the id token
  Future<Map<String, dynamic>> getDataFromToken(String token) async {
    final publicKeys = await _service.getPublicKeys();
    final jws = JsonWebSignature.fromCompactSerialization(token);

    /// Verify the ID token's header conforms to the following constraints
    // Algorithm = "RS256"
    if (jws.commonProtectedHeader['alg'] != 'RS256') {
      throw Exception('Algorithm incorrect');
    }
    // Key ID	Must correspond to one of the public keys listed at https://www.googleapis.com/robot/v1/metadata/x509/securetoken@system.gserviceaccount.com
    final keyId = jws.commonProtectedHeader['kid'] as String;
    final key = publicKeys.keys[keyId];
    if (key == null) {
      throw Exception('Key ID is not found');
    }

    // Verify the ID token's payload conforms to the following constraints:
    final data = jws.unverifiedPayload.jsonContent as Map<String, dynamic>;
    final now = DateTime.now().toUtc().millisecondsSinceEpoch / 1000;

    // exp	Expiration time	Must be in the future. The time is measured in seconds since the UNIX epoch.
    final exp = data['exp'] as int?;
    if (exp == null || exp < now) {
      throw Exception('Token is expired');
    }
    // iat	Issued-at time	Must be in the past. The time is measured in seconds since the UNIX epoch.
    final iat = data['iat'] as int?;
    if (iat == null || iat > now) {
      throw Exception('Token is not issued in the past');
    }

    // aud	Audience	Must be your Firebase project ID, the unique identifier for your Firebase project, which can be found in the URL of that project's console.
    final aud = data['aud'] as String?;
    if (aud != projectId) {
      throw Exception('Token project id does not correspond');
    }

    // iss	Issuer	Must be "https://securetoken.google.com/<projectId>", where <projectId> is the same project ID used for aud above.
    final iss = data['iss'] as String?;
    if (iss != 'https://securetoken.google.com/$projectId') {
      throw Exception('Token issuer is not valid');
    }

    // sub	Subject	Must be a non-empty string and must be the uid of the user or device.
    final sub = data['sub'] as String?;
    if (sub == null || sub.isEmpty) {
      throw Exception('Token subject is not found');
    }

    // auth_time	Authentication time	Must be in the past. The time when the user authenticated.
    final authTime = data['auth_time'] as int?;
    if (authTime == null || authTime > now) {
      throw Exception('Token is not authorized in the past');
    }

    // Finally, ensure that the ID token was signed by the private key corresponding to the token's kid claim.
    final jwk = JsonWebKey.fromPem(key, keyId: keyId);
    final keyStore = JsonWebKeyStore()..addKey(jwk);

    // verify the signature
    final verified = await jws.verify(keyStore);
    if (verified != true) {
      throw Exception('Token signature verification failed');
    }

    return data;
  }

  /// Verify and extract the user object within the id token
  Future<AuthUser> getUserFromToken(String token) async {
    final data = await getDataFromToken(token);
    return AuthUser.fromMap(data);
  }
}
