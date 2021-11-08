import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiple_state_managements/util/styles/colors.dart';
import 'package:multiple_state_managements/util/styles/text_style.dart';
class TagWidget extends StatelessWidget {
  final String text;

  TagWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(
          vertical: 3.h, horizontal: 10.w),
      decoration: BoxDecoration(
          color: AppColors.main,
          borderRadius: BorderRadius.circular(100)),
      child: AutoSizeText(
        this.text,
        style: TextStyles.subStyle.copyWith(color: Colors.white),
        presetFontSizes: [12.sp],
      ),
    );
  }
}
