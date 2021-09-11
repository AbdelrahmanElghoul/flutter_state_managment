import 'package:flutter/material.dart';
import 'package:multiple_state_managements/core/route.dart';
import 'package:multiple_state_managements/screens/home_screen.dart';
import 'package:multiple_state_managements/util/styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) => Future.delayed(Duration(seconds: 2), () {
        Routes.instance.pushReplaceAll(HomeScreen());
      }),
    );
    return Scaffold(

      body: Center(
        child: Icon(
          Icons.movie_filter,
          size: ScreenUtil().screenWidth * .4,
          color: AppColors.main,
        ),
      ),
    );
  }
}
