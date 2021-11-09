import 'package:flutter/material.dart';
import 'package:multiple_state_managements/core/service/api_constant.dart';
import 'package:multiple_state_managements/util/widget/movie_thumbnail.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback? openDrawer;
  const HomeScreen({this.openDrawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Home"),
        leading: IconButton(
          onPressed: openDrawer,
          icon: const Icon(
            Icons.dehaze,
          ),
        ),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: RefreshController(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.55,
              crossAxisSpacing: 10.h,
              mainAxisSpacing: 10.h,
            ),
            itemCount: 50,
            itemBuilder: (_, i) {
              return MovieThumbnail(
                  name: "name $i",
                  imgUrl: APIUrl.imgPath + "6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg");
            },
          ),
        ),
      ),
    );
  }
}
