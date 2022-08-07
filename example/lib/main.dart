import 'package:firebase_auth_token/firebase_auth_token.dart';

void main() async {
  final fat = FirebaseAuthToken(projectId: 'example');
  final authenticatedUser = await fat.getUserFromToken('token');
  // ignore: avoid_print
  print(authenticatedUser);
}
