import 'package:flutter/material.dart';

import '../../../../Constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardForEmpinfodetail extends StatelessWidget {
  const CustomCardForEmpinfodetail(
      {super.key,
      this.mainTitle,
      this.firstRowTitle,
      this.fivthRowSubTitle,
      this.secondRowTitle,
      this.secondRowSubTitle,
      this.thirdRowTitle,
      this.thirdRowSubTitle,
      this.fourthRowTitle,
      this.fourthRowSubTitle,
      this.fivthRowTitle,
      this.firstRowSubTitle,
      this.sixthRowShow = true,
      this.sixthRowTitle,
      this.sixthRowSubTitle});
  final String? mainTitle;
  final String? firstRowTitle;
  final String? firstRowSubTitle;

  final String? secondRowTitle;
  final String? secondRowSubTitle;

  final String? thirdRowTitle;
  final String? thirdRowSubTitle;

  final String? fourthRowTitle;
  final String? fourthRowSubTitle;
  final String? fivthRowTitle;
  final String? fivthRowSubTitle;
  final bool sixthRowShow;
  final String? sixthRowTitle;
  final String? sixthRowSubTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 360.w,
      // height: 224.h,
      margin: const EdgeInsets.only(bottom: 20, left: 23, right: 21, top: 10).r,
      padding:
          const EdgeInsets.only(left: 23, right: 20, bottom: 26, top: 17).r,

      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(
              1.0,
              3.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainTitle!,
            style: GoogleFonts.montserrat(
              fontSize: 16.sp,
              color: const Color(0xff262422),
              fontWeight: FontWeight.bold,
            ),
          ),
          15.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 100,
                  child: Text(firstRowTitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: titleStyle)),
              10.pw,
              Expanded(
                child: Text(firstRowSubTitle!,
                    maxLines: 1,
                    textDirection: TextDirection.rtl,
                    style: subTitleStyle),
              )
            ],
          ),
          8.ph,
          const Divider(
            color: Color(0xffF1ECEC),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 100,
                  child: Text(secondRowTitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: titleStyle)),
              Expanded(
                child: Text(secondRowSubTitle!,
                    maxLines: 1,
                    textDirection: TextDirection.rtl,
                    style: subTitleStyle),
              )
            ],
          ),
          8.ph,
          const Divider(
            color: Color(0xffF1ECEC),
          ),
          8.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 100,
                  child: Text(thirdRowTitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: titleStyle)),
              Expanded(
                child: Text(thirdRowSubTitle!,
                    maxLines: 1,
                    textDirection: TextDirection.rtl,
                    style: subTitleStyle),
              )
            ],
          ),
          8.ph,
          const Divider(
            color: Color(0xffF1ECEC),
          ),
          8.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 100,
                  child: Text(fourthRowTitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: titleStyle)),
              Expanded(
                child: Text(fourthRowSubTitle!,
                    maxLines: 1,
                    textDirection: TextDirection.rtl,
                    style: subTitleStyle),
              )
            ],
          ),
          8.ph,
          const Divider(
            color: Color(0xffF1ECEC),
          ),
          8.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 100,
                  child: Text(fivthRowTitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: titleStyle)),
              Expanded(
                child: Text(fivthRowSubTitle!,
                    maxLines: 1,
                    textDirection: TextDirection.rtl,
                    style: subTitleStyle),
              )
            ],
          ),
          8.ph,
          const Divider(
            color: Color(0xffF1ECEC),
          ),
          if (sixthRowShow) ...[
            8.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 100,
                    child: Text(sixthRowTitle!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: titleStyle)),
                Expanded(
                  child: Text(sixthRowSubTitle!,
                      maxLines: 1,
                      textDirection: TextDirection.rtl,
                      style: subTitleStyle),
                )
              ],
            ),
            8.ph,
            const Divider(
              color: Color(0xffF1ECEC),
            ),
          ]
        ],
      ),
    );
  }
}

var titleStyle = GoogleFonts.montserrat(
  fontSize: 14.sp,
  color: const Color(0xff262422),
  fontWeight: FontWeight.w600,
);
var subTitleStyle = GoogleFonts.montserrat(
  fontSize: 14.sp,
  color: const Color(0xffABABAB),
  fontWeight: FontWeight.w600,
);
