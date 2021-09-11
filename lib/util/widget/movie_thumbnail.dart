import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiple_state_managements/core/route.dart';
import 'package:multiple_state_managements/screens/movie/movie_details_screen.dart';
import 'package:multiple_state_managements/util/styles/colors.dart';

import 'package:multiple_state_managements/util/styles/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MovieThumbnail extends StatelessWidget {

  final String imgUrl;
  final String name;

  MovieThumbnail({required this.name,required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: ()=>Routes.instance.push(MovieDetailsScreen()),
      child: Container(
        margin: EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.h),
          color:AppColors.secondaryBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.1,
              blurRadius: 1,
              offset: Offset(0.5, 0.5), // changes position of shadow
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(bottom:5.0,top: 5,left: 5,right: 5),
                  child: Image.network(this.imgUrl,fit: BoxFit.contain,
                      loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null ?
                            loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes??1)
                                : null,
                          ),
                        );
                      }
                  ),
                )),

            Expanded(
              flex: 3,
              child: Center(
                child: AutoSizeText(this.name,
                    maxLines: 2,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.defaultStyle,
                presetFontSizes: TextStyles.defaultFontSize),
              ),
            )
          ],
        ),
      ),
    );
  }
}
