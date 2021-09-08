import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiple_state_managements/util/styles/colors.dart';
import 'package:multiple_state_managements/util/styles/text_style.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({Key? key}) : super(key: key);

  @override
  _ReviewWidgetState createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  bool showMoreReview = false;

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
            borderRadius: BorderRadius.circular(10)),
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
            AutoSizeText("${DateTime.now()}",style: TextStyles.subStyle,),
            SizedBox(height: 10),
            AutoSizeText(
              text,
              style: TextStyles.subStyle,
              maxLines: showMoreReview ? null : 5,
              overflow: TextOverflow.fade,
            ),
          ],
        ),
      ),
    );
  }
}
