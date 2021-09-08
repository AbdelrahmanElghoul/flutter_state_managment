import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiple_state_managements/core/route.dart';
import 'package:multiple_state_managements/util/styles/colors.dart';
import 'package:multiple_state_managements/util/styles/text_style.dart';
import 'package:multiple_state_managements/util/widget/movie_card.dart';
import 'package:multiple_state_managements/util/widget/review_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.main,
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
            icon: Icon(
              Icons.favorite,
              color: AppColors.favourite,
            ),
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
              child: MovieCard(),
            ),
            SizedBox(height: 15.h),
            AutoSizeText("Overview",
                style: TextStyles.defaultStyle,
                presetFontSizes: TextStyles.defaultFontSize),
            AutoSizeText(
              "data",
              style: TextStyles.subStyle,
              presetFontSizes: TextStyles.defaultFontSize,
            ),
            SizedBox(height: 15.h),
            AutoSizeText("Trailer",
                style: TextStyles.defaultStyle,
                presetFontSizes: TextStyles.defaultFontSize),
            SizedBox(
              height: 50.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, i) {
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: null,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBackground,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          FittedBox(
                              child: Icon(
                            Icons.slow_motion_video,
                          )),
                          SizedBox(width: 5.w),
                          AutoSizeText(
                            "data",
                            style: TextStyles.subStyle,
                            presetFontSizes: TextStyles.subFontSize,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15.h),
            AutoSizeText(
              "Reviews",
              style: TextStyles.defaultStyle,
              presetFontSizes: TextStyles.defaultFontSize,
            ),
            SingleChildScrollView(
              child: Row(
                children: [
                  ReviewWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
