import 'package:logger/logger.dart';

class Failure {
  final String message;
  static final Logger _logger = Logger();

  Failure._({required this.message});

  factory Failure.server({required String message}) {
    _logger.e('Server Failure: $message');
    return Failure._(message: message);
  }

  factory Failure.connection({required String message}) {
    _logger.e('Connection Failure: $message');
    return Failure._(message: message);
  }

  factory Failure.database({required String message}) {
    _logger.e('Database Failure: $message');
    return Failure._(message: message);
  }
}
