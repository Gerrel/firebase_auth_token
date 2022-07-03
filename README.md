# firebase_auth_token

Extract user from verified Firebase Auth id token.

[![Watch on GitHub][github-watch-badge]][github-watch]
[![Star on GitHub][github-star-badge]][github-star]
[![pub package](https://img.shields.io/pub/v/firebase_auth_token.svg)](https://pub.dev/packages/firebase_auth_token)

## Getting started

There is just one class `FirebaseAuthToken` with the methods `getUserFromToken({authentication-token})` and `getDataFromToken({authentication-token})` which will return a `AuthUser` / `Map<String, dynamic>` object if the token is valid or else it will throw an exception.

```dart
// Get the AuthUser object
final user = await FirebaseAuthToken.getUserFromToken('{token}');

// If there are custom claims in the token then you can use the method
// getCustomClaim(String)
final isAdmin = user.getCustomClaim('isAdmin');
if (isAdmin) {
    ...
}

// -or- getCustomClaims((data) => CustomClaims(data)) to create
// a custom object for the custom claims
class CustomClaims {
    final bool isAdmin;
    CustomClaims(Map<String, dynamic> data) : isAdmin = data['isAdmin'] as bool;
}
final customClaims = user.getCustomClaims((data) => CustomClaims(data));
if (customClaims.isAdmin) {
    ...
}

// -or- if you want to skip the provided objects you can use the raw data below to create a custom object.
final data = await FirebaseAuthToken.getDataFromToken('{token}');


```

## License

This project is licensed under the MIT License - see the 
[license] file for details.

[license]: https://github.com/Gerrel/firebase_auth_token/blob/main/LICENSE
[github-watch-badge]: https://img.shields.io/github/watchers/Gerrel/firebase_auth_token.svg?style=social
[github-watch]: https://github.com/Gerrel/firebase_auth_token/watchers
[github-star-badge]: https://img.shields.io/github/stars/Gerrel/firebase_auth_token.svg?style=social
[github-star]: https://github.com/Gerrel/firebase_auth_token/stargazers
[releases]: https://github.com/Gerrel/firebase_auth_token/releases