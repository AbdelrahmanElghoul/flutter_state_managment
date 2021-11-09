import 'package:flutter/material.dart';
import 'package:multiple_state_managements/screens/home_screen.dart';
import 'package:multiple_state_managements/util/drawer/home_drawer.dart';
import 'package:multiple_state_managements/util/styles/colors.dart';

class HomeController extends StatefulWidget {
  const HomeController({Key? key}) : super(key: key);

  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  double offset = 0;
  double maxWidth = 0;
  double pageHeight(double height) => ((offset / maxWidth) * height) * .075;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    maxWidth = size.width * .5;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  // AppColors.background,
                  Color(0xFFe1e9f4),
                  Color(0xFFe1e9f4),
                  Color(0xFFe1e9f4),
                  Color(0xFFe1e9f4),
                  //------------------
                  Color(0xFFc3d4e9),
                  Color(0xFFc3d4e9),
                  Color(0xFFc3d4e9),
                  //------------------
                  Color(0xFFa5bfde),
                  Color(0xFF86abd3),
                  Color(0xFF6497c8),
                  Color(0xFF3a84bd),
                ]),
          ),
          child: Stack(
            clipBehavior: Clip.antiAlias,
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 150),
                top: pageHeight(size.height),
                bottom: pageHeight(size.height),
                left: offset,
                right: offset * -1,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onHorizontalDragUpdate: onPageDragUpdate,
                  onHorizontalDragEnd: onHorizontalDragEnd,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade200,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(1, 1), // changes position of shadow
                        )
                      ],
                    ),
                    child: HomeScreen(
                      openDrawer: () => setState(
                        () => offset = offset == maxWidth ? 0 : maxWidth,
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 150),
                top: 0,
                bottom: 0,
                left: -maxWidth + offset,
                width: maxWidth,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onHorizontalDragUpdate: onDrawerDragUpdate,
                  onHorizontalDragEnd: onHorizontalDragEnd,
                  child: const HomeDrawer(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onHorizontalDragEnd(DragEndDetails drag) {
    if (offset > maxWidth * .6) {
      offset = maxWidth;
    } else {
      offset = 0;
    }

    setState(() {});
  }

  void onDrawerDragUpdate(DragUpdateDetails drag) {
    offset = drag.localPosition.dx;
    if (offset > maxWidth) offset = maxWidth;
    if (offset < 0) offset = 0;
    setState(() {});
  }

  void onPageDragUpdate(DragUpdateDetails drag) {
    if (offset == 0) return;
    offset = drag.localPosition.dx;
    if (offset > maxWidth) offset = maxWidth;
    if (offset < 0) offset = 0;
    setState(() {});
  }
}
