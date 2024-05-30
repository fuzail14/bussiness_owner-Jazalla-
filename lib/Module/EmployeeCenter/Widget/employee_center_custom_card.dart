// import 'package:bussines_owner/Constants/Extensions/extensions.dart';
// import 'package:bussines_owner/Constants/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// // ignore: must_be_immutable
// class CardEmployeeCenter extends StatelessWidget {
//   CardEmployeeCenter(
//       {super.key,
//       this.headingText,
//       this.onTap,
//       this.svgPath,
//       this.textColor,
//       this.margin});
//   String? headingText;

//   void Function()? onTap;
//   Color? color;
//   String? svgPath;
//   Color? textColor;
//   EdgeInsets? margin;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 140.w,
//         height: 160.h,
//         padding: const EdgeInsets.only(left: 8, right: 8, bottom: 0, top: 36).r,

//         // margin: const EdgeInsets.only(left: 35, right: 0, bottom: 0, top: 0).r,
//         //margin: EdgeInsets.only(left: 10),

//         // decoration: BoxDecoration(
//         //   borderRadius: BorderRadius.circular(16).r,
//         //   color: whiteColor,
//         //   boxShadow: [
//         //     BoxShadow(
//         //       color: Colors.grey.withOpacity(0.2),
//         //       spreadRadius: 0,
//         //       blurRadius: 2,
//         //       offset: Offset(0, 3), // changes position of shadow
//         //     ),
//         //   ],
//         // ),
//         decoration: BoxDecoration(
//           color: whiteColor,
//           border: Border.all(color: const Color(0xff449FC6).withOpacity(0.6)),
//           borderRadius: BorderRadius.circular(8).r,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               offset: const Offset(
//                 1.0,
//                 3.0,
//               ),
//               blurRadius: 10.0,
//               spreadRadius: 1.0,
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             //12.ph,
//             Container(
//               height: 60.22.h,
//               width: 60.22.w,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: const Color(0xff1F3996),
//                 ),
//                 // color: Color(0xffF9F9F9),
//                 // gradient: LinearGradient(
//                 //   stops: [0.01, 0.5],
//                 //   // begin: Alignment.bottomRight,
//                 //   // end: Alignment.bottomLeft,

//                 //   begin:
//                 //       Alignment.bottomCenter, // Begin gradient from top right
//                 //   end: Alignment.topCenter,
//                 //   colors: <Color>[
//                 //     Color(0xff1F3996),
//                 //     Color(0xffFFFFFF),
//                 //   ],
//                 // ),

//                 //borderRadius: BorderRadius.circular(8.0).r,
//               ),
//               child: SvgPicture.asset(
//                 svgPath!,
//                 fit: BoxFit.none,
//               ),
//             ),
//             10.ph,
//             Text(
//               headingText!,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//               // style: GoogleFonts.montserrat(
//               //     fontWeight: FontWeight.w500,
//               //     fontSize: 12.sp,
//               //     color: Color(0xff1C2827)
//               //     ),
//               style: GoogleFonts.roboto(
//                   color: const Color(0xff1F3996),
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14.sp),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
