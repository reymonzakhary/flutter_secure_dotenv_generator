# flutter_secure_dotenv_generator

A development dependency to generate secure dotenv file for the `flutter_secure_dotenv` package.

This package is a forked and maintained version that supports the latest versions of code generation tools including:
- `json_serializable` (^6.11.0)
- `freezed` (^3.2.3)
- `freezed_annotation` (^3.0.1)

## Features

- Generates encrypted `.env` file configurations for Flutter applications
- Compatible with modern Flutter code generation tools
- Supports field renaming strategies (camelCase, snake_case, screamingSnake, etc.)
- Type-safe environment variable access
- Encryption support for sensitive data

## Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_secure_dotenv: ^1.0.1

dev_dependencies:
  flutter_secure_dotenv_generator: ^1.0.6
  build_runner: ^2.4.14
```

## Usage

1. Create a `.env` file in your project root or example directory:

```env
API_BASE_URL=https://api.example.com
API_WEB_SOCKET_URL=wss://api.example.com/ws
```

2. Create a Dart file with the `@DotEnvGen` annotation:

```dart
import 'package:flutter_secure_dotenv/flutter_secure_dotenv.dart';

part 'env.g.dart';

@DotEnvGen(
  filename: '.env',
  fieldRename: FieldRename.screamingSnake,
)
abstract class Env {
  static Env create() {
    String encryptionKey = const String.fromEnvironment("APP_ENCRYPTION_KEY");
    String iv = const String.fromEnvironment("APP_IV_KEY");
    return Env(encryptionKey, iv);
  }

  const factory Env(String encryptionKey, String iv) = _$Env;

  const Env._();

  @FieldKey(defaultValue: "")
  String get apiBaseUrl;

  @FieldKey(defaultValue: "")
  String get apiWebSocketUrl;
}
```

3. Run the code generator:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This will generate the `env.g.dart` file with encrypted environment variables.

## Compatibility

This package is compatible with other code generation tools commonly used in Flutter projects:
- Works alongside `freezed` for immutable data classes
- Compatible with `json_serializable` for JSON serialization
- Supports modern Dart SDK (^3.6.0)

## Example

See the [example](example/) directory for a complete working example.

## License

See [LICENSE](LICENSE) file for details.

#### Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ✅   | ✅  |  ✅   | ✅  |  ✅   |  ✅  |

## Features and Bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/mfazrinizar/flutter_secure_dotenv_generator/issues