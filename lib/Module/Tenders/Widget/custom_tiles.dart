import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

Widget custom_tile(firstText, secondText) {
  return Container(
    color: HexColor('#F9F9F9'),
    width: double.infinity,
    height: 39.h,
    padding: const EdgeInsets.only(left: 27, right: 27).r,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firstText,
          style: GoogleFonts.quicksand(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: HexColor('#3F3939')),
        ),
        Text(
          secondText,
          style: GoogleFonts.quicksand(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: HexColor('#3F3939')),
        ),
      ],
    ),
  );
}

Widget productandServiceInfoCard(
    {required String heading,

    // required double height,
    required Widget child,
    width}) {
  return Padding(
    padding: const EdgeInsets.only(left: 28, right: 27).r,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: GoogleFonts.quicksand(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: HexColor('#3F3939')),
        ),
        10.ph,
        Container(
          width: width,
          //height: height,
          padding: const EdgeInsets.only(left: 15, top: 9, right: 17, bottom: 14).r,
          decoration: BoxDecoration(
              border: Border.all(color: HexColor('#19A3A3')),
              borderRadius: BorderRadius.circular(8).r,
              color: const Color(0xfff9f9f9)),
          child: child,
        ),
        10.ph,
      ],
    ),
  );
}

Widget rowText(
  heading,
  text,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      AutoSizeText(
        heading,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: HexColor('#757A8E')),
      ),
      SizedBox(
        width: 120.w,
        child: AutoSizeText(
          text.toString(),
          textAlign: TextAlign.right,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: HexColor('#0D0B0C')),
        ),
      ),
    ],
  );
}
