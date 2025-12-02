// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flutter_secure_dotenv_generator_example.dart';

// **************************************************************************
// FlutterSecureDotEnvAnnotationGenerator
// **************************************************************************

class _$Env extends Env {
  const _$Env() : super._();

  static const String _encryptedValues =
      'eyJFTkNSWVBUSU9OX0tFWSI6IiIsIklWIjoiIiwiQVBJX0JBU0VfVVJMIjoiIiwiQVBJX1dFQl9TT0NLRVRfVVJMIjoiIn0=';
  @override
  String get encryptionKey => _get('ENCRYPTION_KEY');

  @override
  String get iv => _get('IV');

  @override
  String get apiBaseUrl => _get('API_BASE_URL');

  @override
  String get apiWebSocketUrl => _get('API_WEB_SOCKET_URL');

  T _get<T>(
    String key, {
    T Function(String)? fromString,
  }) {
    T parseValue(String strValue) {
      if (T == String) {
        return (strValue) as T;
      } else if (T == int) {
        return int.parse(strValue) as T;
      } else if (T == double) {
        return double.parse(strValue) as T;
      } else if (T == bool) {
        return (strValue.toLowerCase() == 'true') as T;
      } else if (T == Enum || fromString != null) {
        if (fromString == null) {
          throw Exception('fromString is required for Enum');
        }

        return fromString(strValue.split('.').last);
      }

      throw Exception('Type ${T.toString()} not supported');
    }

    final bytes = base64.decode(_encryptedValues);
    final stringDecoded = String.fromCharCodes(bytes);
    final jsonMap = json.decode(stringDecoded) as Map<String, dynamic>;
    if (!jsonMap.containsKey(key)) {
      throw Exception('Key $key not found in .env file');
    }
    final encryptedValue = jsonMap[key] as String;
    final decryptedValue = base64.decode(encryptedValue);
    final stringValue = String.fromCharCodes(decryptedValue);
    return parseValue(stringValue);
  }
}
