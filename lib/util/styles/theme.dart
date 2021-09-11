import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppTheme{

  static ThemeData theme=ThemeData(
    scaffoldBackgroundColor: AppColors.background,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appBar
    )
  );

}