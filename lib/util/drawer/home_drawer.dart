import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:multiple_state_managements/util/styles/colors.dart';
import 'package:multiple_state_managements/util/styles/text_style.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrain) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kToolbarHeight * .85,
          horizontal: 10,
        ),
        child: Column(
          children: [
            Container(
              height: constrain.maxWidth * .3,
              width: constrain.maxWidth * .3,
              child: FittedBox(
                child: Icon(
                  Icons.movie_filter,
                  color: AppColors.main,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _drawerItemWidget(text: "latest"),
                    _drawerItemWidget(text: "popular"),
                    _drawerItemWidget(text: "top rated"),
                    _drawerItemWidget(text: "favourite"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItemWidget({required String text, VoidCallback? onTap}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        // color: Colors.red.shade100,
        child: Column(
          children: [
            AutoSizeText(
              text,
              style: TextStyles.defaultStyle.copyWith(color: AppColors.main),
              presetFontSizes: TextStyles.defaultFontSize,
            ),
            Divider(color: Colors.grey.shade400),
          ],
        ),
      ),
    );
  }
}
