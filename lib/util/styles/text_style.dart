import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiple_state_managements/util/styles/colors.dart';

abstract class TextStyles{

  static TextStyle defaultStyle=TextStyle();
  static TextStyle subStyle=TextStyle(
    color: AppColors.secondaryFont
  );
  static TextStyle headerStyle=TextStyle(
    fontWeight: FontWeight.bold
  );

  static List<double> subFontSize=[14.sp,12.sp,10.sp];
  static List<double> defaultFontSize=[16.sp,14.sp,12.sp,10.sp];
  static List<double> headerFontSize=[20.sp,18.sp,16.sp,14.sp,12.sp,10.sp];
}