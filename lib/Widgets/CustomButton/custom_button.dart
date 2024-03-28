// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  double? width;
  double? height;
  Color? color;
  Color? borderColor;
  String? text;
  Color? textColor;
  double? fontSize;

  void Function()? onTap;
  EdgeInsetsGeometry? margin;

  CustomButton(
      {super.key,
      this.width,
      this.height,
      this.color,
      this.borderColor,
      this.text,
      this.textColor,
      this.onTap,
      this.fontSize,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin ?? EdgeInsets.all(0),
        decoration: BoxDecoration(
            color: color ?? Colors.transparent,
            borderRadius: BorderRadius.circular(16).r,
            border: Border.all(color: borderColor ?? Colors.transparent)),
        child: Center(
          child: Text(
            text!,
            style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w700,
                fontSize: fontSize ?? 10.sp,
                color: textColor ?? HexColor('#FFFFFF')),
          ),
        ),
      ),
    );
  }
}
