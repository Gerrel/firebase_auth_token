import 'package:firebase_auth_token/src/sip.dart';
import 'package:firebase_auth_token/src/string_email_extension.dart';

export 'package:firebase_auth_token/src/sip.dart';

/// Firebase Auth user
class AuthUser {
  /// Unique user id
  final String id;

  /// The name of the user
  /// which can also be email when not given
  final String name;

  /// Picture url if set
  final String? picture;

  /// The email address of user
  final String email;

  /// Has the email address been verified?
  final bool isEmailVerified;

  /// How did the user authenticate (password/google/apple/...)
  final String signInProvider;

  /// Get a statically typed reference of the sign in provider
  Sip get sip => Sip.fromString(signInProvider);

  /// Time of token generation
  final int iat;

  /// User auth obj constructor
  const AuthUser({
    required this.id,
    required this.name,
    required this.picture,
    required this.email,
    required this.isEmailVerified,
    required this.signInProvider,
    required this.iat,
  });

  @override
  bool operator ==(Object other) => other is AuthUser && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return '''
    User {
      id: $id,
      name: $name,
      picture: $picture,
      email: $email,
      isEmailVerified: $isEmailVerified,
      signInProvider: $signInProvider,
      iat: $iat,
    }
    ''';
  }

  /// create user from data map
  factory AuthUser.fromMap(Map<String, dynamic> data) {
    return AuthUser(
      id: data['sub']! as String,
      name: data['name'] as String? ??
          (data['email']! as String).withoutEmailProvider(),
      picture: data['picture'] as String?,
      email: data['email']! as String,
      isEmailVerified: data['email_verified']! as bool,
      signInProvider: data['firebase']!['sign_in_provider']! as String,
      iat: data['iat']! as int,
    );
  }
}
