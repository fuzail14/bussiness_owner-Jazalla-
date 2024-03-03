import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class CardMakretPlace extends StatelessWidget {
  CardMakretPlace(
      {super.key,
      this.headingText,
      this.boxText,
      this.subHeadingText,
      this.onTap,
      this.svgPath,
      this.textColor});
  String? headingText;
  String? boxText;
  String? subHeadingText;
  void Function()? onTap;
  Color? color;
  String? svgPath;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 154.w,
        // height: 160.h,
        padding: EdgeInsets.only(bottom: 13),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16).r,
          color: HexColor('#F5F6FC'),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 6,
              offset: Offset(0, 8), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            12.ph,
            SvgPicture.asset(
              svgPath!,
              height: 64.h,
              width: 64.w,
            ),
            22.ph,
            RichText(
              text: TextSpan(
                style: GoogleFonts.quicksand(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: textColor),
                children: <TextSpan>[
                  const TextSpan(text: "00"),
                  TextSpan(
                    text: "/00",
                    style: GoogleFonts.quicksand(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff0D0B0C) // Dynamic number color
                        ),
                  ),
                ],
              ),
            ),
            10.ph,
            FadeInLeft(
              duration: Duration(milliseconds: 900),
              child: AutoSizeText(
                headingText!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w600, fontSize: 12.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
