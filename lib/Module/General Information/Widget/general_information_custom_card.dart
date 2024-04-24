import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CardGeneralInformation extends StatelessWidget {
  CardGeneralInformation({
    super.key,
    this.headingText,
    this.subHeadingText,
    this.onTap,
    this.upperIconsvgPath,
    this.centerIconsvgPath,
    this.lowerIconsvgPath,
  });
  String? headingText;
  String? subHeadingText;

  void Function()? onTap;
  Color? color;
  String? upperIconsvgPath;
  String? centerIconsvgPath;
  String? lowerIconsvgPath;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        //width: 363.w,

        padding: const EdgeInsets.only(
          bottom: 13.6,
        ).r,

        margin: const EdgeInsets.only(left: 26, right: 25, bottom: 0).r,
        //margin: EdgeInsets.only(left: 10),

        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(16).r,
        //   color: whiteColor,
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.grey.withOpacity(0.2),
        //       spreadRadius: 0,
        //       blurRadius: 2,
        //       offset: Offset(0, 3), // changes position of shadow
        //     ),
        //   ],
        // ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10).r,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(
                1.0,
                3.0,
              ),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(
                upperIconsvgPath!,
                height: 31.h,
                width: 127.5.w,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.9, right: 19.7, top: 13).r,
              child: Column(
                children: [
                  Image.asset(
                    centerIconsvgPath!,
                    height: 40.h,
                    width: 40.w,
                  ),
                  5.ph,
                  Text(
                    headingText!,
                    style: GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        color: Color(0xff503C3C),
                        fontWeight: FontWeight.w600),
                  ),
                  5.ph,
                  Text(
                    subHeadingText!,
                    style: GoogleFonts.montserrat(
                        fontSize: 10.sp,
                        color: Color(0xff141414),
                        fontWeight: FontWeight.w300),
                  ),
                  10.6.ph,
                  const Divider(
                    color: Color(0xffDBDBDB),
                  ),
                  9.4.ph,
                  Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(lowerIconsvgPath!)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
