import 'package:flutter/material.dart';
import 'package:multiple_state_managements/core/route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiple_state_managements/util/styles/text_style.dart';

class NotificationDialog extends StatelessWidget {
  final String? title;
  final String description;

  const NotificationDialog({this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    // final locale = AppLocalization.of(context) as AppLocalization;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 10),
              if (title != null)
                Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      title??'',
                      textAlign: TextAlign.center,
                      style: TextStyles.headerStyle.copyWith(letterSpacing: 0),
                    ),
                  ],
                ),
              SizedBox(height: 5),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyles.defaultStyle.copyWith(
                    letterSpacing: 0,
                    fontSize: 14.sp,
                    color: Colors.grey.shade800),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
