import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MyButton extends StatelessWidget {
  final OutlinedBorder? outlinedBorder;
  final double? height;
  final double? width;
  final bool loading;
  final double? elevation;
  final double? fontSize;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final double? border;
  final String name;
  final Color? color;
  final FontStyle? fontStyle;
  final Color? textColor;
  final int? maxLines;
  final void Function()? onPressed;
  final TextStyle? style;

  const MyButton(
      {super.key,
      this.outlinedBorder,
      this.loading = false,
      this.fontStyle,
      this.elevation,
      this.fontWeight,
      this.letterSpacing,
      this.fontSize,
      this.textColor,
      this.height,
      this.width,
      this.border,
      required this.name,
      this.color,
      this.maxLines,
      this.onPressed,
      this.style});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 180.w,
      height: height ?? 43.w,
      child: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [primaryColor, primaryColor2],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: elevation ?? 0,
              shape: outlinedBorder ??
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(border ?? 12.r)),
              // side: BorderSide(color: HexColor('#8518FF'), width: 2),
              backgroundColor: color),
          onPressed: onPressed,
          child: loading
              ? CircularProgressIndicator(
                  color: HexColor('#3F63F6'),
                )
              : Text(name,
                  maxLines: maxLines ?? 1,
                  style: style ??
                      GoogleFonts.ubuntu(
                          color: textColor ?? Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          fontStyle: fontStyle,
                          fontSize: fontSize ?? 20.sp),
                  textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
