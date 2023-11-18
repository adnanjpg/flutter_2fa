import 'package:flutter/foundation.dart';

final logger = _LoggerService();

class _LoggerService {
  void d(dynamic message) {
    debugPrint('\x1B[32mDEBUG: $message\x1B[0m');
  }

  void i(dynamic message) {
    debugPrint('\x1B[34mINFO: $message\x1B[0m');
  }

  void e(dynamic message) {
    debugPrint('\x1B[31mERROR: $message\x1B[0m');
  }
}
