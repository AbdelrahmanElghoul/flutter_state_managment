import 'package:flutter/material.dart';
import 'package:multiple_state_managements/core/route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiple_state_managements/util/styles/text_style.dart';
import 'package:multiple_state_managements/util/widget/review_widget.dart';
class MovieReviewsScreen extends StatelessWidget {
  const MovieReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Reviews",
            style: TextStyles.headerStyle,
            overflow: TextOverflow.ellipsis,
          ),
          leading: IconButton(
            onPressed: () => Routes.instance.pop(),
            icon: Icon(Icons.arrow_back_ios),
          ),),
      body:SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(5.h),
          itemCount: 100,
          shrinkWrap: true,
          itemBuilder: (_,i)=>Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: ReviewWidget(),
          ),
        ),
      ),
    );
  }
}
