import 'package:firebase_auth_token/src/string_email_extension.dart';
import 'package:test/test.dart';

void main() {
  test('should be able to get first part of email if applicable', () {
    expect('test'.withoutEmailProvider(), equals('test'));
    expect(''.withoutEmailProvider(), equals(''));
    expect('test@'.withoutEmailProvider(), equals('test@'));
    expect('@test'.withoutEmailProvider(), equals('@test'));
    expect('user@test.com'.withoutEmailProvider(), equals('user'));
  });
}
