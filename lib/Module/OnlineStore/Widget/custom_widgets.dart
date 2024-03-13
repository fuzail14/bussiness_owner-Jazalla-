import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget specificationContainer(String firstText, String secondText) {
  return Container(
    width: 362.w,
    height: 44.h,
    padding: const EdgeInsets.only(left: 15, top: 13, bottom: 12, right: 20).r,
    decoration: BoxDecoration(
        border: Border.all(color: detailCradBorderColor),
        borderRadius: BorderRadius.circular(8),
        color: whiteColor),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(firstText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff5A5A5A))),
        SizedBox(
          width: 60.w,
          child: AutoSizeText(secondText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff5A5A5A))),
        ),
      ],
    ),
  );
}

Widget moreDetailsButton(
    String iconPath, String text, Color color, void Function()? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 77.w,
      height: 75.h,
      decoration: BoxDecoration(
          border: Border.all(color: detailCradBorderColor),
          borderRadius: BorderRadius.circular(8),
          color: color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 24.w,
            height: 24.h,
          ),
          5.ph,
          Text(text,
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff5A5A5A))),
        ],
      ),
    ),
  );
}
