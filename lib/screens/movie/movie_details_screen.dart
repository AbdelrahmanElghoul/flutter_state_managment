import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiple_state_managements/core/route.dart';
import 'package:multiple_state_managements/core/util.dart';
import 'package:multiple_state_managements/util/styles/colors.dart';
import 'package:multiple_state_managements/util/styles/text_style.dart';
import 'package:multiple_state_managements/util/widget/movie_detail_card.dart';
import 'package:multiple_state_managements/util/widget/review_widget.dart';

import 'movie_reviews_screen.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "asd",
          style: TextStyles.headerStyle,
          overflow: TextOverflow.ellipsis,
        ),
        leading: IconButton(
          onPressed: () => Routes.instance.pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.favorite, color: AppColors.favourite),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 0),
              constraints: BoxConstraints(maxHeight: 150.h, minHeight: 50.h),
              child: MovieDetailCard(),
            ),
            SizedBox(height: 15.h),
            //-------description--------
            AutoSizeText("Overview",
                style: TextStyles.defaultStyle,
                presetFontSizes: TextStyles.defaultFontSize),
            AutoSizeText(
              "data",
              style: TextStyles.subStyle,
              presetFontSizes: TextStyles.defaultFontSize,
            ),
            //--------------------------
            SizedBox(height: 15.h),
            //--------Trailer-----------
            AutoSizeText("Trailer",
                style: TextStyles.defaultStyle,
                presetFontSizes: TextStyles.defaultFontSize),

            SingleChildScrollView(
              child: Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: null,
                    child: AnimatedContainer(
                      duration: Duration(seconds:1),
                      width: ScreenUtil().screenWidth*.6,
                      margin: EdgeInsets.all(5.h),
                      padding: EdgeInsets.all(5.h),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBackground,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 0.5,
                            blurRadius: 1,
                            offset:
                                Offset(.5, .5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(


                        children: [
                          FittedBox(
                            child: Icon(
                              Icons.slow_motion_video,
                              size: 35.h,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 5.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText(
                                        "teaser",
                                        style: TextStyles.subStyle,
                                        presetFontSizes: TextStyles.subFontSize,
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                      ),
                                      const SizedBox(width: 5),
                                      AutoSizeText(
                                        dateFormat( DateTime.now()),
                                        style: TextStyles.subStyle,
                                        presetFontSizes: TextStyles.subFontSize,
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3.h),
                                  AutoSizeText(
                                    "data",
                                    style: TextStyles.subStyle,
                                    presetFontSizes: TextStyles.subFontSize,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //--------------------------
            SizedBox(height: 15.h),
            //--------Reviews-----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "Reviews",
                  style: TextStyles.defaultStyle,
                  presetFontSizes: TextStyles.defaultFontSize,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => Routes.instance.push(MovieReviewsScreen()),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AutoSizeText(
                        "more",
                        style: TextStyles.defaultStyle,
                        presetFontSizes: TextStyles.defaultFontSize,
                      ),
                      SizedBox(width: 5.w),
                      Icon(Icons.arrow_forward_ios, size: 20.h),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            SingleChildScrollView(
              child: Row(
                children: [
                  ReviewWidget(),
                ],
              ),
            ),
            //--------------------------
          ],
        ),
      ),
    );
  }
}
