// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:metacces/app_controller.dart';

// class TopWidget extends StatefulWidget {

//   @override
//   State<TopWidget> createState() => _TopWidgetState();
// }

// class _TopWidgetState extends State<TopWidget> {
//   AppController appController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 6.w),
//       child: Row(
//         children: [
//           SvgPicture.asset('assets/svgs/left.svg'),
//           Expanded(
//             child: Container(
//               height: 50.h,
//               padding: const EdgeInsets.all(3),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(36.0),
//                 border: Border.all(
//                   width: 0.5,
//                   color: const Color(0xFFD619D6).withOpacity(0.2),
//                 ),
//               ),
//               child: Container(
//                 padding: const EdgeInsets.all(3),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(36.0),
//                   border: Border.all(
//                     width: 0.5,
//                     color: const Color(0xFF4C19D6).withOpacity(0.2),
//                   ),
//                 ),
//                 child: Container(
//                   padding: const EdgeInsets.all(3),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(36.0),
//                     border: Border.all(
//                       width: 1,
//                       color: const Color(0xFF3C4254).withOpacity(0.2),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: List.generate(
//                       5,
//                       (index) => GestureDetector(
//                         onTap: () {
//                           appController.selectedIndexOperation.value = index;
//                           setState(() {});
//                         },
//                         child: SvgPicture.asset(
//                           'assets/svgs/${index + 1}.svg',
//                           color: appController.selectedIndexOperation.value ==
//                                   index
//                               ? Colors.white
//                               : const Color(0xFF5F6E8B),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SvgPicture.asset(
//             'assets/svgs/rigth.svg',
//           ),
//         ],
//       ),
//     );
//   }
// }
