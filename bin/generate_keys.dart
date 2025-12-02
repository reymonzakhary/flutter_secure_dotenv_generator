import 'package:flutter_secure_dotenv/flutter_secure_dotenv.dart';

void main() {
  final keys = generateKeys();
  print('ENCRYPTION_KEY=${base64.encode(keys.key)}');
  print('IV=${base64.encode(keys.iv)}');
}

/// Holds the key and IV.
class KeyPair {
  final Uint8List key;
  final Uint8List iv;

  KeyPair(this.key, this.iv);
}

/// Generates a random AES key and IV.
KeyPair generateKeys() {
  final key = AESCBCEncrypter.generateRandomBytes(32); // 256-bit key
  final iv = AESCBCEncrypter.generateRandomBytes(16);  // 128-bit IV
  return KeyPair(key, iv);
}
