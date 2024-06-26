import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FontManagment {
  TextStyle montserrat13WithColor(
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        fontSize: fontSize ?? 13.sp,
        fontWeight: fontWeight ?? FontWeight.w700,
        color: color ?? const Color(0xff9FA2AB));
  }

  TextStyle montserrat14WithColor(
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color ?? const Color(0xff313131));
  }

  TextStyle poppins16WithColor(
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        fontSize: fontSize ?? 16.sp,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? const Color(0xff414141));
  }

  TextStyle poppins10WithColor({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        fontSize: 10.sp,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? const Color(0xff3E3434));
  }

  TextStyle poppins14WithColor({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: fontWeight ?? FontWeight.w700,
        color: color ?? const Color(0xff313131));
  }

  TextStyle poppins13WithColor({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        fontSize: 13,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? const Color(0xff9FA2AB));
  }

  var poppins18 = GoogleFonts.poppins(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xffFFFFFF));

  var poppins10White = GoogleFonts.poppins(
      fontSize: 10.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xffFFFFFF));
  var poppins12White = GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xffFFFFFF));
  var poppins8 = GoogleFonts.poppins(
      fontSize: 8.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xff707070));
  var poppins9 = GoogleFonts.poppins(
      fontSize: 9.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xff707070));

  var poppins12 = GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xff707070));
  var ubuntu10red = GoogleFonts.ubuntu(
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xffE85C5C));
  var ubuntu10green = GoogleFonts.ubuntu(
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xff89E85C));

  var montserrat12 = GoogleFonts.montserrat(
    color: const Color(0xff7C828A),
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  var montserrat12White = GoogleFonts.montserrat(
    color: whiteColor,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  var montserrat14 = GoogleFonts.montserrat(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xff3A3A3A));
  var montserrat14White = GoogleFonts.montserrat(
      fontSize: 14.sp, fontWeight: FontWeight.w600, color: whiteColor);
  var montserrat16 = GoogleFonts.montserrat(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xff393939));

  var montserrat18HeadingEmployeeCenterAllModules = GoogleFonts.montserrat(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: blackColor,
  );

  var quicksand4 = GoogleFonts.quicksand(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xff0D0B0C));

  var inter10 = GoogleFonts.inter(
      fontSize: 10.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xff0B0B0B));

  var interColor10 = GoogleFonts.inter(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xff6D6D6D));
  var inter16 = GoogleFonts.inter(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xff5F5656));

  var quicksand12 = GoogleFonts.inter(
      fontSize: 12.sp, fontWeight: FontWeight.w600, color: whiteColor);

  var poppins12Grey = GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.w300,
      color: const Color(0xff9CA2AA));

  var poppins14Black = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xff202046));

  var poppins24 = GoogleFonts.poppins(
      fontSize: 24.sp, fontWeight: FontWeight.w500, color: whiteColor);

  var poppins28 = GoogleFonts.poppins(
      fontSize: 24.sp, fontWeight: FontWeight.w600, color: whiteColor);
  var montserrat18 = GoogleFonts.montserrat(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xff202046));
}
