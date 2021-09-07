import 'package:flutter/foundation.dart';

void log(String key, dynamic value) {
  if (kDebugMode) print("mDebug $key : $value");
}