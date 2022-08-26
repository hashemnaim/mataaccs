// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:metacces/animate_do.dart';
import 'package:metacces/new_screen/circle.dart';
import 'package:metacces/new_screen/new_controller.dart';
import 'dart:math' as math;

class NewScreen extends StatefulWidget {
  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
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
  void dispose() {
    super.dispose();
  }

  NewController newController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF050020),
        body: Obx(
          () => Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: Visibility(
                  visible: newController.isShowCard.value,
                  child: SizedBox(
                    width: 322.w,
                    child: SlideInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.r),
                        child: ListView.builder(
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
              SizedBox(
                height: 20.h,
              ),
              newController.isShowReport.value
                  ? SlideInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: GestureDetector(
                        onHorizontalDragDown: (DragDownDetails downDetails) {
                          // newController.isShowReport.value =
                        },
                        child: Center(
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Visibility(
                                    visible: newController.isShowHints.value,
                                    child: SizedBox(
                                      width: 50.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          leftWidget('Wallets'),
                                          leftWidget('White Paper'),
                                          leftWidget('Social Media'),
                                        ],
                                      ),
                                    ),
                                  ),
                                  CircleWidget(),
                                  Visibility(
                                    visible: newController.isShowHints.value,
                                    child: SizedBox(
                                      width: 50.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          rightWidget('Account'),
                                          rightWidget('News'),
                                          rightWidget('Support'),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        newController.isShowReport.value =
                            !newController.isShowReport.value;
                      },
                      child: SlideInUp(
                        duration: const Duration(milliseconds: 1000),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                  color:
                                      const Color(0xFFD619D6).withOpacity(0.2),
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
                                      color:
                                          const Color.fromARGB(255, 96, 97, 100)
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
                            SvgPicture.asset('assets/svgs/rigth.svg'),
                          ],
                        ),
                      ),
                    ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget leftWidget(String title) {
  return Positioned(
    bottom: 5.h,
    left: 0,
    right: 0,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: Image.asset(
              'assets/svgs/rigth_bubble.png',
              width: 98.w,
              height: 40.h,
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
    ),
  );
}

Widget rightWidget(String title) {
  return Positioned(
    bottom: 5.h,
    left: 0,
    right: 0,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          child: Image.asset(
            'assets/svgs/rigth_bubble.png',
            width: 98.w,
            height: 40.h,
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
    ),
  );
}
