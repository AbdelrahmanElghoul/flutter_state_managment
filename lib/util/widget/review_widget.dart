import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiple_state_managements/core/util.dart';
import 'package:multiple_state_managements/util/styles/colors.dart';
import 'package:multiple_state_managements/util/styles/text_style.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({Key? key}) : super(key: key);

  @override
  _ReviewWidgetState createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  bool showMoreReview = false;
  final int _reviewMaxLines = 5;

  @override
  Widget build(BuildContext context) {
    String text =
        "https:// storage.g oogleapis.com/nrpassets/uploads/artic les/1568805897-BeFunky-collage_26.jpg https://storage.googleapis.com/nrpassets/uploads/articles/1568805897-BeFunky-collage_26.jpg https://storage.googleapis.com/nrpassets/uploads/articles/1568805897-BeFunky-collage_26.jpg https://storage.googleapis.com/nrpassets/uploads/articles/1568805897-BeFunky-collage_26.jpg";
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => setState(() => showMoreReview = !showMoreReview),
      child: AnimatedContainer(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0.8,
              blurRadius: 1,
              offset: Offset(.25, .25), // changes position of shadow
            )
          ],
        ),
        duration: Duration(seconds: 1),
        constraints: BoxConstraints(
            minWidth: 0, maxWidth: ScreenUtil().screenWidth * .8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: AutoSizeText(
                    "name",
                    style: TextStyles.subStyle,
                    presetFontSizes: TextStyles.defaultFontSize,
                  ),
                ),
                AutoSizeText("4/10")
              ],
            ),
            AutoSizeText(
              dateFormat( DateTime.now()),
              style: TextStyles.subStyle,
            ),
            SizedBox(height: 10),
            AutoSizeText(
              text,
              style: TextStyles.subStyle,
              maxLines: showMoreReview ? null : _reviewMaxLines,
              overflowReplacement: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "$text",
                    style: TextStyles.subStyle,
                    maxLines: _reviewMaxLines,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: AutoSizeText(
                      "read more",
                      style: TextStyles.headerStyle.copyWith(
                        color: AppColors.main,
                        decoration: TextDecoration.underline,
                      ),
                      maxLines: _reviewMaxLines,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
