import 'package:flutter_secure_dotenv/flutter_secure_dotenv.dart';

part 'flutter_secure_dotenv_generator_example.g.dart';

@DotEnvGen(
  filename: '.env',
  fieldRename: FieldRename.screamingSnake,
)
abstract class Env {
  const factory Env() = _$Env; // ← no parameters

  const Env._();

  @FieldKey(defaultValue: String.fromEnvironment("APP_ENCRYPTION_KEY"))
  String get encryptionKey;

  @FieldKey(defaultValue: String.fromEnvironment("APP_IV_KEY"))
  String get iv;

  @FieldKey(defaultValue: "")
  String get apiBaseUrl;

  @FieldKey(defaultValue: "")
  String get apiWebSocketUrl;
}
