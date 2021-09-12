import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiple_state_managements/core/model/movie.dart';
import 'package:multiple_state_managements/core/service/api_constant.dart';
import 'package:multiple_state_managements/core/util.dart';
import 'package:multiple_state_managements/util/styles/colors.dart';
import 'package:multiple_state_managements/util/styles/text_style.dart';
import 'package:multiple_state_managements/util/widget/tag.dart';

class MovieDetailCard extends StatelessWidget {
  final Movie movie;

  MovieDetailCard(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.secondaryBackground,
        borderRadius: BorderRadius.circular(15.h),
        // image: DecorationImage(image: NetworkImage(  APIUrl.imgPath+(this.movie.posterPath??''),),),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.1,
            blurRadius: 1,
            offset: Offset(0.5, 0.5), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: ScreenUtil().screenWidth * .25,
            child: Image.network(
              APIUrl.imgPath + (this.movie.posterPath ?? ''),
              fit: BoxFit.cover,
              // width: ScreenUtil().screenWidth*.25,
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            flex: 5,
            child: Padding(

              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AutoSizeText(
                    movie.title ?? movie.originalTitle ?? '-',
                    style: TextStyles.headerStyle,
                    presetFontSizes: TextStyles.defaultFontSize,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.yellow, size: 15.h),
                      SizedBox(width: 3),
                      AutoSizeText(
                        "${movie.voteAverage ?? '-'}",
                        style: TextStyles.subStyle,
                        presetFontSizes: TextStyles.subFontSize,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(height: 5.h),
                  AutoSizeText(
                    dateFormat(DateTime.now()),
                    style: TextStyles.defaultStyle,
                    presetFontSizes: TextStyles.defaultFontSize,
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 5.h,
                      runSpacing: 5.h,
                      children: [
                        if (movie.adult ?? false) TagWidget("+18"),
                        TagWidget("${movie.runtime ?? '-'} min"),
                        ...?movie.spokenLanguages
                            ?.map((e) => TagWidget(
                                e.iso6391 ?? e.name ?? e.englishName ?? '-'))
                            .toList(),
                        ...?movie.genres
                            ?.map((e) => TagWidget(e.name ?? ''))
                            .toList()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
