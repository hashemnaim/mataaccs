// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:metacces/animate_do.dart';
import 'package:metacces/app_controller.dart';
import 'package:metacces/custom_text_field.dart';
import 'package:metacces/menu_card.dart';

class AccessScreen extends StatefulWidget {
  @override
  State<AccessScreen> createState() => _AccessScreenState();
}

class _AccessScreenState extends State<AccessScreen>
    with TickerProviderStateMixin {
  AppController appController = Get.find();

  @override
  void initState() {
    super.initState();
    if (!appController.recognizing) {
      appController.streamingRecognize();
    } else {
      appController.stopRecording();
    }

    log('isScroll $isScroll');

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  int isScroll = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF171c27),
        body: Obx(
          () => Stack(
            children: [
              Lottie.asset(
                'assets/lottie.json',
                fit: BoxFit.fitHeight,
                width: Get.width,
                height: Get.height,
              ),
              Container(
                width: Get.width,
                height: Get.height,
                color: const Color(0xFF3C4254).withOpacity(0.1),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 15.w,
                          height: 546.h,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(25.0),
                            ),
                            color: const Color(0xFF3C4254).withOpacity(0.2),
                          ),
                        ),
                        Container(
                          width: 325.w,
                          // height: 682.h,

                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: const Color(0xFF3C4254).withOpacity(0.2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.16),
                                offset: const Offset(0, 3.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 35.h,
                              ),
                              Container(
                                width: 275.w,
                                height: 80.h,
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.r),
                                  color: const Color(0xFF171c27),
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xff3C4254),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 38.w,
                                          height: 38.h,
                                          decoration: const BoxDecoration(
                                            color: Colors.yellow,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 7.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              '0 BTC',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                height: 1.21,
                                              ),
                                            ),
                                            Text(
                                              '\$45,200.39',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                height: 1.21,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'BSC',
                                          style: TextStyle(
                                            fontFamily: 'Al Bayan',
                                            fontSize: 10.0,
                                            color: Colors.white,
                                            height: 1.7,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 9.h,
                                        ),
                                        SizedBox(
                                          width: 57.w,
                                          height: 16.h,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              SvgPicture.string(
                                                '<svg viewBox="0.0 3.0 14.0 8.0" ><path transform="translate(0.0, 3.0)" d="M 5.494846343994141 1.720175266265869 C 6.291668891906738 0.8095209002494812 7.708330154418945 0.8095208406448364 8.505152702331543 1.72017514705658 L 11.09761619567871 4.682990074157715 C 12.22913646697998 5.976156234741211 11.31078052520752 8 9.592462539672852 8 L 4.407536506652832 8 C 2.689218997955322 8 1.770863175392151 5.976156234741211 2.902383089065552 4.682990550994873 Z" fill="#8edb41" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                width: 14.0,
                                                height: 8.0,
                                              ),
                                              const Text(
                                                '17.87%',
                                                style: TextStyle(
                                                  fontFamily: 'DIN Alternate',
                                                  fontSize: 12.0,
                                                  color: Color(0xFF8EDB41),
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.42,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  const Text(
                                    'Address',
                                    style: TextStyle(
                                      fontFamily: 'ITC Avant Garde Gothic Std',
                                      fontSize: 14.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      height: 1.21,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CustomTextFormField(
                                    hintText: 'Please paste the address here',
                                  ),
                                  SizedBox(
                                    height: 35.h,
                                  ),
                                  const Text(
                                    'Amount',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      height: 1.21,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  CustomTextFormField(
                                    hintText: '0.10064656',
                                  ),
                                  SizedBox(
                                    height: 17.h,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 10.w,
                                        height: 10.h,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFF8EDB41),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      Text(
                                        'transaction fee is ( 5 ) USDT',
                                        style: TextStyle(
                                          fontFamily:
                                              'ITC Avant Garde Gothic Std',
                                          fontSize: 12.0,
                                          color: Colors.white.withOpacity(0.8),
                                          fontWeight: FontWeight.w300,
                                          height: 1.42,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 28.h,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 10.w,
                                        height: 10.h,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFF8EDB41),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6.w,
                                      ),
                                      Text(
                                        '''Funds can be retrieved from the Aib wallet \nimmediately if an investment plan is not''',
                                        style: TextStyle(
                                          fontFamily:
                                              'ITC Avant Garde Gothic Std',
                                          fontSize: 12.0,
                                          color: Colors.white.withOpacity(0.8),
                                          fontWeight: FontWeight.w300,
                                          // height: 1.42,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  Center(
                                    child: Container(
                                      width: 275.w,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        color: const Color(0xFF3C4254)
                                            .withOpacity(0.2),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.16),
                                            offset: const Offset(0, 3.0),
                                            blurRadius: 6.0,
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Confirm',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                            height: 1.06,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: appController.text.value != '',
                                    child: Text(
                                      appController.text.value.split(' ').last,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(color: Colors.white),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 15.w,
                          height: 546.h,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(25.0),
                            ),
                            color: const Color(0xFF3C4254).withOpacity(0.2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Visibility(
                    visible: !appController.showMenuCard.value,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svgs/left.svg'),
                        // AnimatedContainer(
                        //   duration: const Duration(milliseconds: 1000),
                        //   width: 100.w,
                        //   height: 100.h,
                        //   padding: const EdgeInsets.all(3),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(36.0),
                        //     border: Border.all(
                        //       width: 0.5,
                        //       color: const Color(0xFFD619D6).withOpacity(0.2),
                        //     ),
                        //   ),
                        //   child: Container(
                        //     padding: const EdgeInsets.all(3),
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(36.0),
                        //       border: Border.all(
                        //         width: 0.5,
                        //         color: const Color(0xFF4C19D6).withOpacity(0.2),
                        //       ),
                        //     ),
                        //     child: Container(
                        //       padding: const EdgeInsets.all(3),
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(36.0),
                        //         border: Border.all(
                        //           width: 1,
                        //           color:
                        //               const Color(0xFF3C4254).withOpacity(0.2),
                        //         ),
                        //       ),
                        //       child: GestureDetector(
                        //         onTap: () {
                        //           appController.showMenuCard.value =
                        //               !appController.showMenuCard.value;
                        //           setState(() {});
                        //         },
                        //         child: Image.asset(
                        //           'assets/svgs/meta_logo.png',
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        SvgPicture.asset('assets/svgs/rigth.svg'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
              Positioned(
                bottom: 0.h,
                child: Visibility(
                  visible: appController.showMenuCard.value,
                  child: FadeIn(
                    duration: const Duration(milliseconds: 1000),
                    child: MenuCard(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
