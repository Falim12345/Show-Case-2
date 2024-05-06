import 'package:crypto/crypto.dart';
import 'dart:convert';

class HashPassword {
  String hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}
