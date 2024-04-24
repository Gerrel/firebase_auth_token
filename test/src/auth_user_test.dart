import 'package:firebase_auth_token/src/auth_user.dart';
import 'package:jose/jose.dart';
import 'package:test/test.dart';

class CustomClaims {
  final String aud;
  CustomClaims(Map<String, dynamic> data) : aud = data['aud'] as String;
}

void main() {
  AuthUser user1() {
    const token =
        r'eyJhbGciOiJSUzI1NiIsImtpZCI6IjFkZTgwNjdhODI5OGE0ZTMzNDRiNGRiZGVkMjVmMmZiNGY0MGYzY2UiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiSm9obiBEb2UiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDYuZ29vZ2xldXNlcmNvbnRlbnQuY29tLy0tZU92dDFsOEZEZy9BQUFBQUFBQUFBSS9BQUFBQUFBQUFBQS9zbXNJVWFNSjMydy9waG90by5qcGciLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vZGV2Y2RhLXRlc3QiLCJhdWQiOiJkZXZjZGEtdGVzdCIsImF1dGhfdGltZSI6MTYxODAwMDEzOSwidXNlcl9pZCI6IjdacUpxRkV5cTlWZlJHeHpuTkJnM0ZWbkJ5VjIiLCJzdWIiOiI3WnFKcUZFeXE5VmZSR3h6bk5CZzNGVm5CeVYyIiwiaWF0IjoxNjE4MDAwMTM5LCJleHAiOjE2MTgwMDM3MzksImVtYWlsIjoiam9obkBkb2UuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZ29vZ2xlLmNvbSI6WyIxMTc4MTYzNDUxOTA1NzU0Mjg5ODAiXSwiZW1haWwiOlsiam9obkBkb2UuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0=.n9GWhoGpMfgTLaNSL6W4LthaGbn4esa3s8WvejxJJCUy0boarxlC8DvvKavmomiHeM2aPFCAli37FnNbGzRg9uBNblAn-CTy-q_w2d3T018POUbEleUS124RFuJ-vzIcvjo_oyP9n6fzKiXCtGMMufgeU1lH7IgtLQcBz2oWquG_NfxthfHKmwsOugNsvW_lDU40sIc01d1_vt3xMUePrhXif_-6QSESpDHgDYf_gNgQ8Popjw82IkpXGiTZmoOsiVq5Emvt95au-uIpAu9jh6kbAtu7lfaxfA-qvVTInZ67bZPHMRXYjy-G2AJD_naXmC220D9QbKoY7WE-3K-3cg';
    final jws = JsonWebSignature.fromCompactSerialization(token);
    final data = jws.unverifiedPayload.jsonContent as Map<String, dynamic>;
    final user = AuthUser.fromMap(data);
    return user;
  }

  AuthUser user2() {
    const token =
        r'eyJhbGciOiJSUzI1NiIsImtpZCI6IjFkZTgwNjdhODI5OGE0ZTMzNDRiNGRiZGVkMjVmMmZiNGY0MGYzY2UiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjpudWxsLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDYuZ29vZ2xldXNlcmNvbnRlbnQuY29tLy0tZU92dDFsOEZEZy9BQUFBQUFBQUFBSS9BQUFBQUFBQUFBQS9zbXNJVWFNSjMydy9waG90by5qcGciLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vZGV2Y2RhLXRlc3QiLCJhdWQiOiJkZXZjZGEtdGVzdCIsImF1dGhfdGltZSI6MTYxODAwMDEzOSwidXNlcl9pZCI6IjdacUpxRkV5cTlWZlJHeHpuTkJnM0ZWbkJ5VjIiLCJzdWIiOiI3WnFKcUZFeXE5VmZSR3h6bk5CZzNGVm5CeVYyIiwiaWF0IjoxNjE4MDAwMTM5LCJleHAiOjE2MTgwMDM3MzksImVtYWlsIjoiam9obkBkb2UuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImZpcmViYXNlIjp7ImlkZW50aXRpZXMiOnsiZ29vZ2xlLmNvbSI6WyIxMTc4MTYzNDUxOTA1NzU0Mjg5ODAiXSwiZW1haWwiOlsiam9obkBkb2UuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0=.n9GWhoGpMfgTLaNSL6W4LthaGbn4esa3s8WvejxJJCUy0boarxlC8DvvKavmomiHeM2aPFCAli37FnNbGzRg9uBNblAn-CTy-q_w2d3T018POUbEleUS124RFuJ-vzIcvjo_oyP9n6fzKiXCtGMMufgeU1lH7IgtLQcBz2oWquG_NfxthfHKmwsOugNsvW_lDU40sIc01d1_vt3xMUePrhXif_-6QSESpDHgDYf_gNgQ8Popjw82IkpXGiTZmoOsiVq5Emvt95au-uIpAu9jh6kbAtu7lfaxfA-qvVTInZ67bZPHMRXYjy-G2AJD_naXmC220D9QbKoY7WE-3K-3cg';
    final jws = JsonWebSignature.fromCompactSerialization(token);
    final data = jws.unverifiedPayload.jsonContent as Map<String, dynamic>;
    final user = AuthUser.fromMap(data);
    return user;
  }

  test('should be able to parse auth user from token with name', () {
    final user = user1();

    expect(user, isNotNull);
    expect(user.id, equals('7ZqJqFEyq9VfRGxznNBg3FVnByV2'));
    expect(user.email, equals('john@doe.com'));
    expect(user.isEmailVerified, equals(true));
    expect(user.name, equals('John Doe'));
    expect(user.signInProvider, equals('password'));
    expect(user.sip, equals(Sip.password));
    expect(
      user.picture,
      equals(
        'https://lh6.googleusercontent.com/--eOvt1l8FDg/AAAAAAAAAAI/AAAAAAAAAAA/smsIUaMJ32w/photo.jpg',
      ),
    );
  });

  test('should be able to parse auth user from token without name', () {
    final user = user2();

    expect(user, isNotNull);
    expect(user.id, equals('7ZqJqFEyq9VfRGxznNBg3FVnByV2'));
    expect(user.email, equals('john@doe.com'));
    expect(user.isEmailVerified, equals(true));
    expect(user.name, equals('john'));
    expect(user.signInProvider, equals('password'));
    expect(user.sip, equals(Sip.password));
    expect(
      user.picture,
      equals(
        'https://lh6.googleusercontent.com/--eOvt1l8FDg/AAAAAAAAAAI/AAAAAAAAAAA/smsIUaMJ32w/photo.jpg',
      ),
    );
  });

  test('should check equality based on the id', () {
    expect(user1(), equals(user2()));
    expect(user1().hashCode, equals(user2().hashCode));
  });

  test('should get proper toString value', () {
    expect('${user1()}'.trim(), startsWith('AuthUser {'));
  });

  test('should be able to extract custom claims', () {
    final user = user1();
    expect(user.getCustomClaim('aud'), equals('devcda-test'));

    final obj = user.getCustomClaims(CustomClaims.new);
    expect(obj.aud, equals('devcda-test'));
  });
}
