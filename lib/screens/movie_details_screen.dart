import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiple_state_managements/core/route.dart';
import 'package:multiple_state_managements/util/styles/colors.dart';
import 'package:multiple_state_managements/util/widget/movie_card.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.main,
        leading: IconButton(
          onPressed: () => Routes.instance.pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children:[
          AnimatedContainer(
              padding: EdgeInsets.all(15.h),
duration: Duration(seconds: 0),
              constraints:BoxConstraints(maxHeight: 180.h,minHeight: 50.h),
              child: MovieCard()),
        ]

      ),
    );
  }
}
