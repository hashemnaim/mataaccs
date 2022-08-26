import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:metacces/app_controller.dart';

class MenuCard extends StatelessWidget {
  AppController appController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          color: const Color(0xFF171c27).withOpacity(0.8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 35.h,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              width: 220.w,
              height: 220.h,
              padding: const EdgeInsets.all(3),
              child: Image.asset(
                'assets/svgs/Untitled.png',
                width: 220.w,
                height: 220.h,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 60.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            width: 45.w,
                            height: 45.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFF171C27),
                              border: Border.all(
                                width: 1.5,
                                color: const Color(0xFF3C4254).withOpacity(0.2),
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              'assets/svgs/3.svg',
                              // color: const Color(0xFF5F6E8B),
                              width: 18.w,
                              height: 18.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 45.w,
                            height: 45.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFF171C27),
                              border: Border.all(
                                width: 1.5,
                                color: const Color(0xFF3C4254).withOpacity(0.2),
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              'assets/svgs/2.svg',
                              color: const Color(0xFF5F6E8B),
                              width: 18.w,
                              height: 18.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 45.w,
                            height: 45.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF171C27),
                              border: Border.all(
                                width: 1.5,
                                color: const Color(0xFF3C4254).withOpacity(0.2),
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              'assets/svgs/4.svg',
                              color: const Color(0xFF5F6E8B),
                              width: 18.w,
                              height: 18.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 45.w,
                            height: 45.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFF171C27),
                              border: Border.all(
                                width: 1.5,
                                color: const Color(0xFF3C4254).withOpacity(0.2),
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              'assets/svgs/2.svg',
                              color: const Color(0xFF5F6E8B),
                              width: 18.w,
                              height: 18.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            width: 45.w,
                            height: 45.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF171C27),
                              border: Border.all(
                                width: 1.5,
                                color: const Color(0xFF3C4254).withOpacity(0.2),
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              'assets/svgs/5.svg',
                              color: const Color(0xFF5F6E8B),
                              width: 18.w,
                              height: 18.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            width: 45.w,
                            height: 45.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF171C27),
                              border: Border.all(
                                width: 1.5,
                                color: const Color(0xFF3C4254).withOpacity(0.2),
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              'assets/svgs/5.svg',
                              color: const Color(0xFF5F6E8B),
                              width: 18.w,
                              height: 18.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(child: SvgPicture.asset('assets/svgs/left.svg')),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  width: 100.w,
                  height: 100.h,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36.0),
                    border: Border.all(
                      width: 0.5,
                      color: const Color(0xFFD619D6).withOpacity(0.2),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      appController.showMenuCard.value =
                          !appController.showMenuCard.value;
                    },
                    child: Image.asset(
                      'assets/svgs/meta_logo.png',
                    ),
                  ),
                ),
                SvgPicture.asset('assets/svgs/rigth.svg'),
              ],
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
