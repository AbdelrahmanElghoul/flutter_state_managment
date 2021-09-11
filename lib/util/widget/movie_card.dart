import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiple_state_managements/core/util.dart';
import 'package:multiple_state_managements/util/styles/colors.dart';
import 'package:multiple_state_managements/util/styles/text_style.dart';

class MovieCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.secondaryBackground,
        borderRadius: BorderRadius.circular(15.h),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.1,
            blurRadius: 1,
            offset: Offset(0.5, 0.5), // changes position of shadow
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Image.network(
              "https://storage.googleapis.com/nrpassets/uploads/articles/1568805897-BeFunky-collage_26.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          "Title1",
                          style: TextStyles.headerStyle,
                          presetFontSizes: TextStyles.headerFontSize,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        height: 30.h,
                        width: 30.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: AppColors.mainLight,
                            borderRadius: BorderRadius.circular(100)),
                        child: AutoSizeText(
                          "8",
                          style: TextStyles.subStyle,
                          presetFontSizes: TextStyles.subFontSize,
                        ),
                      ),
                    ],
                  ),
                  AutoSizeText(
                    dateFormat(DateTime.now()),
                    style: TextStyles.defaultStyle,
                    presetFontSizes: TextStyles.defaultFontSize,
                  ),
                  Spacer(),
                  Flexible(
                    fit: FlexFit.tight,
                    child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, i) {
                        return Container(
                          margin: EdgeInsets.only(right: 5),
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 10.w),
                          decoration: BoxDecoration(
                              color: AppColors.mainLight,
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: AutoSizeText(
                              "Drama",
                              style: TextStyles.subStyle,
                              presetFontSizes: TextStyles.subFontSize,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
