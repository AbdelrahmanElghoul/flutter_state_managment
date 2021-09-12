import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiple_state_managements/core/model/genres.dart';
import 'package:multiple_state_managements/core/model/movie.dart';
import 'package:multiple_state_managements/core/model/spoken_language.dart';
import 'package:multiple_state_managements/core/route.dart';
import 'package:multiple_state_managements/core/util.dart';
import 'package:multiple_state_managements/util/styles/colors.dart';
import 'package:multiple_state_managements/util/styles/text_style.dart';
import 'package:multiple_state_managements/util/widget/movie_detail_card.dart';
import 'package:multiple_state_managements/util/widget/review_widget.dart';
import 'movie_reviews_screen.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie = Movie(
    imdbId: "tt0076759",
    voteAverage: 8.2,
    originalLanguage: "en",
    originalTitle: "Star Wars",
    overview:
        "Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.",
    posterPath: "/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg",
    title: "Star Wars",
    backdropPath: "/zqkmTXzjkAgXmEWLRsY4UpTWCeo.jpg",
    genres: [
      Genres(id: 12, name: "Adventure"),
      Genres(id: 28, name: "Action"),
      Genres(id: 878, name: "Science Fiction"),
    ],
    id: 11,
    adult: true,
    releaseDate: "1977-05-25",
    spokenLanguages: [
      SpokenLanguages(englishName: "English", iso6391: "en", name: "English")
    ],
    runtime: 170,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.title ?? movie.originalTitle ?? '',
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
            icon: Icon(Icons.favorite, color: AppColors.favourite),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieDetailCard(this.movie),
            SizedBox(height: 15.h),
            //-------tags---------------
            // AutoSizeText("Tags",
            //     style: TextStyles.headerStyle,
            //     presetFontSizes: TextStyles.headerFontSize),
            // SizedBox(height: 10.h),
            // SizedBox(
            //   width: ScreenUtil().screenWidth * .9,
            //   child: Wrap(
            //     alignment: WrapAlignment.center,
            //     spacing: 10.h,
            //     runSpacing: 10.h,
            //     children: [
            //       if (movie.adult ?? false) TagWidget("+18"),
            //       TagWidget("${movie.runtime ?? '-'} min"),
            //       ...?movie.spokenLanguages
            //           ?.map((e) => TagWidget(
            //               e.iso6391 ?? e.name ?? e.englishName ?? '-'))
            //           .toList(),
            //       ...?movie.genres?.map((e) => TagWidget(e.name ?? '')).toList()
            //     ],
            //   ),
            // ),
            //--------------------------
            // SizedBox(height: 15.h),
            //-------description--------
            AutoSizeText("Overview",
                style: TextStyles.headerStyle,
                presetFontSizes: TextStyles.headerFontSize),
            AutoSizeText(
              this.movie.overview ?? '-',
              style: TextStyles.subStyle,
              presetFontSizes: TextStyles.defaultFontSize,
            ),
            //--------------------------
            SizedBox(height: 15.h),
            //--------Trailer-----------
            AutoSizeText("Trailer",
                style: TextStyles.headerStyle,
                presetFontSizes: TextStyles.headerFontSize),

            SingleChildScrollView(
              child: Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: null,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: ScreenUtil().screenWidth * .6,
                      margin: EdgeInsets.all(5.h),
                      padding: EdgeInsets.all(5.h),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBackground,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 0.5,
                            blurRadius: 1,
                            offset:
                                Offset(.5, .5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          FittedBox(
                            child: Icon(
                              Icons.slow_motion_video,
                              size: 35.h,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 5.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText(
                                        "teaser",
                                        style: TextStyles.subStyle,
                                        presetFontSizes: TextStyles.subFontSize,
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                      ),
                                      const SizedBox(width: 5),
                                      AutoSizeText(
                                        dateFormat(DateTime.now()),
                                        style: TextStyles.subStyle,
                                        presetFontSizes: TextStyles.subFontSize,
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3.h),
                                  AutoSizeText(
                                    "data",
                                    style: TextStyles.subStyle,
                                    presetFontSizes: TextStyles.subFontSize,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //--------------------------
            SizedBox(height: 15.h),
            //--------Reviews-----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "Reviews",
                  style: TextStyles.headerStyle,
                  presetFontSizes: TextStyles.headerFontSize,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => Routes.instance.push(MovieReviewsScreen()),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AutoSizeText(
                        "more",
                        style: TextStyles.defaultStyle,
                        presetFontSizes: TextStyles.defaultFontSize,
                      ),
                      SizedBox(width: 5.w),
                      Icon(Icons.arrow_forward_ios, size: 20.h),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            SingleChildScrollView(
              child: Row(
                children: [
                  ReviewWidget(),
                ],
              ),
            ),
            //--------------------------
          ],
        ),
      ),
    );
  }
}
