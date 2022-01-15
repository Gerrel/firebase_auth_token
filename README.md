# firebase_auth_token

Extract user from verified Firebase Auth id token.

[![Watch on GitHub][github-watch-badge]][github-watch]
[![Star on GitHub][github-star-badge]][github-star]
[![pub package](https://img.shields.io/pub/v/firebase_auth_token.svg)](https://pub.dev/packages/firebase_auth_token)

## Getting started

There is just one class `FirebaseAuthToken` with just one method `getUserFromToken({authentication-token})` which will return a `AuthUser` object if the token is valid or else it will throw an exception.

```dart
final user = FirebaseAuthToken.getUserFromToken('{token}');
```

## License

This project is licensed under the MIT License - see the 
[license] file for details.

[license]: https://github.com/Gerrel/firebase_auth_token/blob/master/LICENSE.md
[github-watch-badge]: https://img.shields.io/github/watchers/Gerrel/firebase_auth_token.svg?style=social
[github-watch]: https://github.com/Gerrel/firebase_auth_token/watchers
[github-star-badge]: https://img.shields.io/github/stars/Gerrel/firebase_auth_token.svg?style=social
[github-star]: https://github.com/Gerrel/firebase_auth_token/stargazers
[releases]: https://github.com/Gerrel/firebase_auth_token/releases