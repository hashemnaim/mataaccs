// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:metacces/animate_do.dart';
import 'package:metacces/app_controller.dart';
import 'package:metacces/menu_card.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool showTopCard = false;
  bool showMenuCard = false;
  bool showButton = true;
  int typeWallet = 0; //0=> M.Chain , 1=> Centeal
  List<String> chainMethod = ['Swap', 'Exchange'];
  List<String> centealMethod = ['Spot', 'Smart'];
  GlobalKey<FlipCardState> cardKey1 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey2 = GlobalKey<FlipCardState>();
  ScrollController scrollController = ScrollController();
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: appController.selectedIndexOperation.value,
      length: 5,
      vsync: this,
    );
    tabController!.addListener(() {
      appController.selectedIndexOperation.value = tabController!.index;
    });
    log('isScroll $isScroll');

    setState(() {});
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  int isScroll = 0;
  AppController appController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Column(
            children: [
              SizedBox(
                height: showTopCard ? 20.h : 30.h,
              ),
              Visibility(
                visible: showTopCard,
                child: SlideInDown(
                  duration: const Duration(milliseconds: 1000),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svgs/left.svg'),
                        Expanded(
                          child: Container(
                            height: 50.h,
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36.0),
                              border: Border.all(
                                width: 0.5,
                                color: const Color(0xFFD619D6).withOpacity(0.2),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(36.0),
                                border: Border.all(
                                  width: 0.5,
                                  color:
                                      const Color(0xFF4C19D6).withOpacity(0.2),
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(36.0),
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xFF3C4254)
                                        .withOpacity(0.2),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: List.generate(
                                    5,
                                    (index) => GestureDetector(
                                      onTap: () {
                                        tabController!.animateTo(
                                          index,
                                          duration: const Duration(seconds: 1),
                                        );
                                        appController.selectedIndexOperation
                                            .value = index;
                                        setState(() {});
                                      },
                                      child: SvgPicture.asset(
                                        'assets/svgs/${index + 1}.svg',
                                        color: appController
                                                    .selectedIndexOperation
                                                    .value ==
                                                index
                                            ? Colors.white
                                            : const Color(0xFF5F6E8B),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/svgs/rigth.svg',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: showTopCard,
                child: SizedBox(
                  height: 20.h,
                ),
              ),
              Expanded(
                child: Stack(
                  // overflow: Overflow.visible,
                  children: [
                    showMenuCard
                        ? MenuCard()
                        : TabBarView(
                            physics: const BouncingScrollPhysics(),
                            children: List.generate(
                              5,
                              (index) => Container(
                                // width: 285.w,
                                // height: 682.h,
                                margin: EdgeInsets.symmetric(horizontal: 25.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color:
                                      const Color(0xFF3C4254).withOpacity(0.2),
                                  border: Border.all(
                                    width: 1.0,
                                    color: const Color(0xFF707070)
                                        .withOpacity(0.05),
                                  ),
                                ),
                                child: ClipRRect(
                                  child: ListView.builder(
                                    controller: scrollController,
                                    itemBuilder: (context, index) =>
                                        const Text(''),
                                  ),
                                ),
                              ),
                            ),
                            controller: tabController,
                          ),
                    Visibility(
                      visible: showTopCard,
                      child: Positioned(
                        bottom: -10.h,
                        left: 175.w,
                        child: FadeIn(
                          duration: const Duration(milliseconds: 1000),
                          child: GestureDetector(
                            onTap: () {
                              showTopCard = !showTopCard;
                              showMenuCard = false;
                              setState(() {});
                            },
                            child: Container(
                              width: 25.w,
                              height: 25.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFF171C27),
                                border: Border.all(
                                  width: 1.5,
                                  color:
                                      const Color(0xFF3C4254).withOpacity(0.2),
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 14.r,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Visibility(
                visible: showButton,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: showTopCard,
                      child: FlipCard(
                        key: cardKey1,
                        fill: Fill.fillBack,
                        direction: FlipDirection.VERTICAL,
                        front: card(
                          typeWallet == 0 ? chainMethod[0] : centealMethod[0],
                        ),
                        back: card(
                          typeWallet == 0 ? chainMethod[0] : centealMethod[0],
                        ),
                      ),
                    ),
                    SvgPicture.asset('assets/svgs/left.svg'),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      width: showTopCard ? 175.w : 60.w,
                      height: 60.h,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36.0),
                        border: Border.all(
                          width: 0.5,
                          color: const Color(0xFFD619D6).withOpacity(0.2),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36.0),
                          border: Border.all(
                            width: 0.5,
                            color: const Color(0xFF4C19D6).withOpacity(0.2),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(36.0),
                            border: Border.all(
                              width: 1,
                              color: Color.fromARGB(255, 96, 97, 100)
                                  .withOpacity(0.2),
                            ),
                          ),
                          child: showTopCard
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        typeWallet = 0;
                                        cardKey1.currentState!.toggleCard();
                                        cardKey2.currentState!.toggleCard();
                                        setState(() {});
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            typeWallet == 0
                                                ? 'assets/svgs/active.svg'
                                                : 'assets/svgs/disactive.svg',
                                            width: 23.w,
                                            height: 23.h,
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            'M.Chain',
                                            style: TextStyle(
                                              fontSize: 6.sp,
                                              color: typeWallet == 0
                                                  ? Colors.white
                                                  : Colors.white
                                                      .withOpacity(0.3),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showMenuCard = !showMenuCard;
                                        setState(() {});
                                      },
                                      child: Image.asset(
                                        'assets/svgs/meta_logo.png',
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        typeWallet = 1;
                                        cardKey1.currentState!.toggleCard();
                                        cardKey2.currentState!.toggleCard();
                                        setState(() {});
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            typeWallet == 1
                                                ? 'assets/svgs/active.svg'
                                                : 'assets/svgs/disactive.svg',
                                            width: 23.w,
                                            height: 23.h,
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            'Centeal',
                                            style: TextStyle(
                                              fontSize: 6.sp,
                                              color: typeWallet == 1
                                                  ? Colors.white
                                                  : Colors.white
                                                      .withOpacity(0.3),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              : GestureDetector(
                                  onTap: () {
                                    showTopCard = !showTopCard;
                                    setState(() {});
                                  },
                                  child: Image.asset(
                                    'assets/svgs/meta_logo.png',
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SvgPicture.asset('assets/svgs/rigth.svg'),
                    Visibility(
                      visible: showTopCard,
                      child: FlipCard(
                        key: cardKey2,
                        fill: Fill.fillBack,
                        direction: FlipDirection.VERTICAL,
                        front: card(
                          typeWallet == 0 ? chainMethod[1] : centealMethod[1],
                        ),
                        back: card(
                          typeWallet == 0 ? chainMethod[1] : centealMethod[1],
                        ),
                      ),
                    ),
                  ],
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

Widget card(String title) {
  return Container(
    width: 70.w,
    height: 30.h,
    padding: const EdgeInsets.all(3),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(36.0),
      border: Border.all(
        width: 0.5,
        color: const Color(0xFFD619D6).withOpacity(0.2),
      ),
    ),
    child: Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36.0),
        border: Border.all(
          width: 0.5,
          color: const Color(0xFF4C19D6).withOpacity(0.2),
        ),
      ),
      child: Container(
        // padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36.0),
          border: Border.all(
            width: 1,
            color: const Color(0xFF3C4254).withOpacity(0.2),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}
