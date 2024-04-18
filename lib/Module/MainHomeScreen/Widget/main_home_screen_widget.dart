import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/constants.dart';

Widget dashBoardFirstGrid({
  required String icon,
  required String title,
  required String subTitle,
}) {
  return Container(
    width: 156.w,
    padding: EdgeInsets.only(left: 0, right: 0, top: 16, bottom: 16).r,
    decoration: BoxDecoration(
        color: whiteColor, borderRadius: BorderRadius.circular(12).r),
    child: Column(
      children: [
        SizedBox(width: 48.w, height: 48.h, child: Image.asset(icon)),
        10.ph,
        Text(
          title,
          textAlign: TextAlign.start,
          style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff202046)),
        ),
        10.ph,
        Text(
          subTitle,
          style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff9CA2AA)),
        ),
      ],
    ),
  );
}

Widget othersListTile({
  required String icon,
  required String title,
  required String subTitle,
}) {
  return ListTile(
    leading: SizedBox(width: 48.w, height: 48.h, child: Image.asset(icon)),
    title: SizedBox(
      width: 200.w,
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xff202046)),
      ),
    ),
    subtitle: SizedBox(
      width: 200.w,
      child: Text(
        subTitle,
        maxLines: 1,
        style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xff9CA2AA)),
      ),
    ),
  );
}
