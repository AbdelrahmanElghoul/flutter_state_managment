import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

void log(String key, dynamic value) {
  if (kDebugMode) print("mDebug $key : $value");
}


String dateFormat(DateTime dateTime){
  return DateFormat('dd MMM yyyy').format(dateTime);
}