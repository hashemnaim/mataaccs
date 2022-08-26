// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:developer';
import 'dart:math' as math;

import 'package:animated_rotation/animated_rotation.dart' as anim;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metacces/animation_circle/circle_item.dart';
import 'package:metacces/animation_circle/circle_list.dart';
import 'package:metacces/animation_circle/radial_drag_gesture_detector.dart';
import 'package:metacces/new_screen/new_controller.dart';

class CircleWidget extends StatefulWidget {
  @override
  State<CircleWidget> createState() => _CircleWidgetState();
}

class _CircleWidgetState extends State<CircleWidget> {
  NewController newController = Get.find();
  double angle = 0;
  bool visabileCircle = false;
  double getAngle(int angle) {
    return (math.pi / 180) * angle;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        log('isShowReport ${newController.isShowReport.value}');
        if (newController.isShowReport.value) {
          newController.isShowHints.value = false;
          log('isShowHints ${newController.isShowHints.value}');
        } else {}
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget bigCircle = Container(
      width: 200.w,
      height: 200.h,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
    );

    return Container(
      width: 230.w,
      height: 230.h,
      // decoration: const BoxDecoration(
      //   color: Colors.transparent,
      //   shape: BoxShape.circle,
      // ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/svgs/circle_image.png',
          ),
          Center(
            child: Stack(
              children: <Widget>[
                bigCircle,
                anim.AnimatedRotation(
                  angle: angle,
                  child: CircleList(
                    outerRadius: 110.r,
                    innerRadius: 75.r,
                    initialAngle: 0,
                    outerCircleColor: Colors.transparent,
                    innerCircleColor: Colors.transparent,
                    rotateMode: RotateMode.stopRotate,
                    origin: const Offset(0, 0),
                    children: List.generate(
                      8,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            if (newController.selectedIndexHome == index) {
                              visabileCircle = !visabileCircle;

                              setState(() {});
                            } else {
                              newController.isShowCard.value = false;

                              angle = ((8 - index) * 360 / 8) - 90;
                              setState(() {});
                              newController.selectedIndexHome = index;
                              Future.delayed(Duration(seconds: 1), () {
                                newController.isShowCard.value = true;
                              });
                            }
                          },
                          child: anim.AnimatedRotation(
                            angle: -angle,
                            child: CircleItem(
                              isSelect:
                                  newController.selectedIndexHome == index,
                              images: const [],
                              index: index + 1,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Positioned(
          //   bottom: 5.h,
          //   left: 0,
          //   right: 0,
          //   child: Stack(
          //     clipBehavior: Clip.none,
          //     children: [
          //       Center(
          //         child: Image.asset(
          //           'assets/svgs/bottom.png',
          //           width: 98.w,
          //           height: 40.h,
          //           color: const Color(0xFF3C4254),
          //         ),
          //       ),
          //       Positioned(
          //         top: 0,
          //         bottom: 0,
          //         left: 0,
          //         right: 0,
          //         child: Center(
          //           child: Text(
          //             newController.title[newController.selectedIndexHome],
          //             style: const TextStyle(
          //               fontFamily: 'ITC Avant Garde Gothic Std',
          //               fontSize: 16.0,
          //               color: Colors.white,
          //               fontWeight: FontWeight.w300,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: Container(
                  color: const Color(0xFF050020),
                  width: 120.w,
                  height: 120.h,
                  child: Image.asset(
                    'assets/svgs/report.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
