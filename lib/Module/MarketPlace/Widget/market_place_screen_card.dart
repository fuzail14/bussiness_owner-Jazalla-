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
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 153.w,
        height: 128.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16).r,
          color: Color(0xffF5F9F9),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, top: 12, right: 5, bottom: 0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInUp(
                child: SvgPicture.asset(
                  svgPath!,
                  color: Color(0xff479696),
                  height: 40.h,
                  //width: 40.w,
                ),
              ),
              8.ph,
              FadeInLeft(
                duration: const Duration(milliseconds: 900),
                child: AutoSizeText(
                  headingText!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      color: Color(0xff479696),
                      fontWeight: FontWeight.w800,
                      fontSize: 14.sp),
                ),
              ),
              4.ph,
              FadeInRight(
                duration: Duration(milliseconds: 900),
                child: AutoSizeText(
                  'It serves as a comprehensive directory, showcasing company profiles.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(
                      color: Color(0xff8DAEAE),
                      fontWeight: FontWeight.w800,
                      fontSize: 14.sp),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
