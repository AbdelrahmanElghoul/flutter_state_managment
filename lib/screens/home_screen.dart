import 'package:flutter/material.dart';
import 'package:multiple_state_managements/util/widget/movie_poster_name.dart';
import 'package:multiple_state_managements/util/styles/colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        centerTitle: false,
        title: Text("Home"),
      ),
      body: SafeArea(
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          controller: RefreshController(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10.h,
                mainAxisSpacing: 10.h,
              ),
              itemCount: 50,
              itemBuilder: (_, i) {
                return MoviePosterName(
                    name: "name ${i * i * i * i * i * i}",
                    imgUrl:
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Google_Chrome_icon_%28September_2014%29.svg/1200px-Google_Chrome_icon_%28September_2014%29.svg.png");
              },
            ),
          ),
        ),
      ),
    );
  }
}
