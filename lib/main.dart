// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metacces/animation_circle/circle_animation.dart';
import 'package:metacces/app_controller.dart';
import 'package:metacces/new_screen/new_controller.dart';

import 'access_screen.dart';
import 'new_screen/new_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        Get.put(AppController());
        Get.put(NewController());

        return GetMaterialApp(
          title: 'Metacces',
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFF171C27),
            primarySwatch: Colors.grey,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home:
              // AccessScreen(),
              CircleAnimationScreen(),
          debugShowCheckedModeBanner: false,
          locale: const Locale('en'),
        );
      },
    );
  }
}
