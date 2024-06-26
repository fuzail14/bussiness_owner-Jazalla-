import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CardGeneralInformation extends StatelessWidget {
  CardGeneralInformation(
      {super.key,
      this.iconPath,
      this.headingText,
      this.subHeadingText,
      this.onTap,
      this.trailingIconPath});
  String? iconPath;
  String? headingText;
  String? subHeadingText;
  String? trailingIconPath;
  void Function()? onTap;

  // Color? color;
  // String? upperIconsvgPath;
  // String? centerIconsvgPath;
  // String? lowerIconsvgPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //width: 363.w,

        padding: const EdgeInsets.only(
          //left: 22,
          // right: 21.7,
          top: 13,
          bottom: 13,
        ).r,

        margin: const EdgeInsets.symmetric(horizontal: 31).r,

        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(7).r,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              offset: const Offset(
                1.0,
                3.0,
              ),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              color: const Color(0xffF7F7F7),
              borderRadius: BorderRadius.circular(7),
            ),
            height: 56.h,
            width: 56.w,
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7).r,
            child: Image.asset(iconPath!),
          ),
          title: Text(
            headingText!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
                fontSize: 15,
                color: const Color(0xff12175E),
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            'General Information For',
            style: GoogleFonts.poppins(
                fontSize: 12,
                color: const Color(0xff12175E),
                fontWeight: FontWeight.w300),
          ),
          trailing: Icon(
            Icons.arrow_forward,
            color: blackColor,
            size: 22,
          ),
        ),
        // child: Stack(
        //   children: [
        //     Align(
        //       alignment: Alignment.centerRight,
        //       child: SvgPicture.asset(
        //         upperIconsvgPath!,
        //         height: 31.h,
        //         width: 127.5.w,
        //       ),
        //     ),
        //     Padding(
        //       padding:
        //           const EdgeInsets.only(left: 20.9, right: 19.7, top: 13).r,
        //       child: Column(
        //         children: [
        //           Image.asset(
        //             centerIconsvgPath!,
        //             height: 40.h,
        //             width: 40.w,
        //           ),
        //           5.ph,
        //           Text(
        //             headingText!,
        //             style: GoogleFonts.montserrat(
        //                 fontSize: 12.sp,
        //                 color: Color(0xff503C3C),
        //                 fontWeight: FontWeight.w600),
        //           ),
        //           5.ph,
        //           Text(
        //             subHeadingText!,
        //             style: GoogleFonts.montserrat(
        //                 fontSize: 10.sp,
        //                 color: Color(0xff141414),
        //                 fontWeight: FontWeight.w300),
        //           ),
        //           10.6.ph,
        //           const Divider(
        //             color: Color(0xffDBDBDB),
        //           ),
        //           9.4.ph,
        //           Align(
        //               alignment: Alignment.topRight,
        //               child: SvgPicture.asset(lowerIconsvgPath!)),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
