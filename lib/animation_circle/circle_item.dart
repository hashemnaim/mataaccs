import 'package:flutter/material.dart';

class CircleItem extends StatelessWidget {
  final int? index;
  final List? images;
  final bool? isSelect;

  const CircleItem({
    Key? key,
    this.index,
    this.images,
    this.isSelect = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100.h,
      // width: 72.w,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image.asset(
          'assets/svgs/$index.png',
          color: isSelect! ? Colors.white : Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
