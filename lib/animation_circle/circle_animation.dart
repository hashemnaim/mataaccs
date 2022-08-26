import 'dart:math' as math;
import 'dart:math';

import 'package:animated_rotation/animated_rotation.dart' as anim;
import 'package:circular_widgets/circular_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:metacces/animate_do.dart';
import 'package:metacces/animation_circle/circle_item.dart';
import 'package:metacces/animation_circle/circle_list.dart';
import 'package:metacces/animation_circle/radial_drag_gesture_detector.dart';
import 'package:metacces/app_controller.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../circle_test.dart';
import '../new_screen/new_controller.dart';
import '../utils/colors.dart';

class CircleAnimationScreen extends StatefulWidget {
  @override
  State<CircleAnimationScreen> createState() => _CircleAnimationScreenState();
}

class _CircleAnimationScreenState extends State<CircleAnimationScreen> {
  double angle = 0;
  bool visabileCircle = false;
  double getAngle(int angle) {
    return (math.pi / 180) * angle;
  }

  double opacity = 0;
  bool inmate = false;
  double innerSpacingDivider = 10;
  double radiusOfItemDivider = 6;
  double centerWidgetRadiusDivider = 3;

  double startAngleDeg = 0;
  double totalArchDeg = 360;
  bool isClockwise = true;
  AppController appController = Get.find();
  NewController newController = Get.find();

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

    return Scaffold(
        backgroundColor: AppColors.primary,
        body: Obx(
          () => Column(
            children: [
              newController.isShowReport.value
                  ? Container()
                  : SizedBox(
                      height: 220.h,
                    ),
              SizedBox(
                height: 470.h,
                child: Visibility(
                  visible: newController.isShowCard.value,
                  child: SizedBox(
                    width: 322.w,
                    child: SlideInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.r),
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) => Container(
                            width: 322.w,
                            height: 105.h,
                            margin: EdgeInsets.symmetric(vertical: 10.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: const Color(0xFF3C4254).withOpacity(0.2),
                              border: Border.all(
                                width: 1.0,
                                color:
                                    const Color(0xFF707070).withOpacity(0.05),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              newController.isShowReport.value
                  ? Expanded(
                      child: Stack(
                        // fit: StackFit.expand,
                        children: [
                          Positioned(
                            bottom: 55.h,
                            left: 0.w,
                            right: 0.w,
                            child: Image.asset(
                              "assets/svgs/background_bluer.png",
                              fit: BoxFit.contain,
                              height: 220.h,
                              width: 350.w,
                              colorBlendMode: BlendMode.dstIn,
                              color: const Color(0xff3C4254).withOpacity(0.1),
                            ),
                          ),
                          Positioned(
                            bottom: 55.h,
                            left: 0,
                            right: 0,
                            child: Image.asset(
                              "assets/svgs/background_icon.png",
                              fit: BoxFit.contain,
                              height: 230.h,
                              width: 220.w,
                              // colorBlendMode: BlendMode.dstIn,
                              // color: const Color(0xff3C4254).withOpacity(0.1),
                            ),
                          ),
                          Positioned(
                            bottom: 90.h,
                            left: 0,
                            right: 0,
                            child: Image.asset(
                              "assets/svgs/avatar.png",
                              fit: BoxFit.contain,
                              height: 160.h,
                              width: 160.w,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Center(
                              child: Stack(
                                children: <Widget>[
                                  bigCircle,
                                  anim.AnimatedRotation(
                                    angle: angle,
                                    child: CircleList(
                                      outerRadius: 125.r,
                                      innerRadius: 45.r,
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
                                              if (newController
                                                      .selectedIndexHome ==
                                                  index) {
                                                visabileCircle =
                                                    !visabileCircle;
                                                setState(() {
                                                  inmate = false;
                                                  opacity = 0;
                                                });

                                                Future.delayed(
                                                    const Duration(seconds: 1),
                                                    () {
                                                  setState(() {
                                                    inmate = true;
                                                    opacity = 1;
                                                  });
                                                });
                                              } else {
                                                visabileCircle =
                                                    !visabileCircle;

                                                newController.isShowCard.value =
                                                    false;

                                                angle =
                                                    ((8 - index) * 360 / 8) -
                                                        270;
                                                newController
                                                    .selectedIndexHome = index;
                                                opacity = 0;
                                                inmate = false;

                                                setState(() {});
                                                appController
                                                    .selectedIndexHome = index;
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 300), () {
                                                  newController
                                                      .isShowCard.value = true;
                                                  inmate = true;
                                                  opacity = 1;

                                                  setState(() {});
                                                });
                                              }
                                            },
                                            child: anim.AnimatedRotation(
                                              angle: -angle,
                                              child: CircleItem(
                                                isSelect: newController
                                                        .selectedIndexHome ==
                                                    index,
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
                          ),
                          appController.selectedIndexHome == -1 || opacity == 0
                              ? Container()
                              : Positioned(
                                  bottom: 63.h,
                                  left: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 80),
                                    child: AnimatedOpacity(
                                      opacity: opacity,
                                      duration: const Duration(milliseconds: 1),
                                      child: FadeInUp(
                                        animate: inmate,
                                        child: SizedBox(
                                          width: 10.w,
                                          // color: Colors.red,
                                          child: Center(
                                            child: Text(
                                              appController.listName[
                                                  appController
                                                      .selectedIndexHome],
                                              style: TextStyle(
                                                fontFamily:
                                                    'ITC Avant Garde Gothic Std',
                                                fontSize: 12.sp,
                                                color: Colors.white
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                          if (appController.selectedIndexHome == -1)
                            const SizedBox(
                              height: 1,
                              width: 1,
                            )
                          else
                            Visibility(
                                visible: visabileCircle,
                                child: Stack(children: [
                                  Positioned(
                                      bottom: 200.h,
                                      right: 35.w,
                                      child: FadeInRight(
                                          child: rightWidget(
                                              appController.listName[
                                                  appController
                                                      .selectedIndexHome],
                                              width: 60))),
                                  Positioned(
                                      bottom: 135.h,
                                      right: 25.w,
                                      child: FadeInRight(
                                        child:
                                            rightWidget("Wallets", width: 55),
                                      )
                                      // color: Color(0xff3C4254).withOpacity(0.4),

                                      ),
                                  Positioned(
                                      bottom: 74.h,
                                      right: 36.w,
                                      child: FadeInRight(
                                          child: rightWidget(
                                              appController.listName[
                                                  appController
                                                      .selectedIndexHome],
                                              width: 60))),
                                  Positioned(
                                      bottom: 200.h,
                                      left: 35.w,
                                      child: FadeInLeft(
                                          child: leftWidget(
                                              appController.listName[
                                                  appController
                                                      .selectedIndexHome],
                                              width: 60))
                                      // color: Color(0xff3C4254).withOpacity(0.4),

                                      ),
                                  Positioned(
                                      bottom: 135.h,
                                      left: 25.w,
                                      child: FadeInLeft(
                                          child:
                                              leftWidget("Wallets", width: 55))
                                      // color: Color(0xff3C4254).withOpacity(0.4),

                                      ),
                                  Positioned(
                                      bottom: 74.h,
                                      left: 36.w,
                                      child: FadeInLeft(
                                          child: leftWidget(
                                              appController.listName[
                                                  appController
                                                      .selectedIndexHome],
                                              width: 60))),
                                ]))
                        ],
                      ),
                    )
                  : Expanded(
                      child: GestureDetector(
                        onTap: () {
                          newController.isShowReport.value =
                              !newController.isShowReport.value;
                        },
                        child: SlideInUp(
                          duration: const Duration(milliseconds: 1000),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/svgs/left.svg'),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 1000),
                                width: 60.w,
                                height: 60.h,
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(36.0),
                                  border: Border.all(
                                    width: 0.5,
                                    color: const Color(0xFFD619D6)
                                        .withOpacity(0.2),
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(36.0),
                                    border: Border.all(
                                      width: 0.5,
                                      color: const Color(0xFF4C19D6)
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(36.0),
                                      border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                                255, 96, 97, 100)
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        newController.isShowReport.value =
                                            !newController.isShowReport.value;
                                      },
                                      child: Image.asset(
                                        'assets/svgs/meta_logo.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.h),
                                child:
                                    SvgPicture.asset('assets/svgs/rigth.svg'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ));
  }

  Widget leftWidget(String title, {double width = 65, double height = 65}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: Image.asset(
              'assets/svgs/rigth_bubble.png',
              width: width.w,
              height: height.h,
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'ITC Avant Garde Gothic Std',
                fontSize: 8.sp,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget rightWidget(String title, {double width = 65, double height = 65}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          child: Image.asset(
            'assets/svgs/rigth_bubble.png',
            width: width.w,
            height: height.h,
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'ITC Avant Garde Gothic Std',
                fontSize: 8.sp,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
