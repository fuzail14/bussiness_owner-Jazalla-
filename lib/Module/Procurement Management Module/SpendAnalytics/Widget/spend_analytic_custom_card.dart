import 'dart:ui';

import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CardSpendAnalytic extends StatelessWidget {
  CardSpendAnalytic({
    super.key,
    required this.iconPath,
    required this.headingText,
    required this.subHeadingText,
    this.onTap,
    required this.fotterIconPath,
    required this.fotterText,
    required this.fotterTextColor,
  });
  String iconPath;
  String headingText;

  String subHeadingText;
  String fotterIconPath;
  String fotterText;
  Color fotterTextColor;

  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 167,
        height: 157,
        padding: const EdgeInsets.only(
          left: 6,
          right: 6,
          top: 16,
          bottom: 0,
        ).r,
        margin: const EdgeInsets.only(
          left: 26,
        ).r,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(16).r,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(
                1.0,
                1.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF7F7F7),
                borderRadius: BorderRadius.circular(7),
              ),
              height: 48,
              width: 48,
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
              child: Image.asset(iconPath!),
            ),
            6.ph,
            Text(
              headingText!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: const Color(0xff12175E),
                  fontWeight: FontWeight.w500),
            ),
            3.ph,
            Text(
              subHeadingText!,
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: const Color(0xff12175E),
                  fontWeight: FontWeight.w300),
            ),
            6.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  fotterIconPath!,
                  height: 12,
                  width: 12,
                ),
                5.pw,
                Text(
                  fotterText!,
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: fotterTextColor,
                      fontWeight: FontWeight.w300),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
