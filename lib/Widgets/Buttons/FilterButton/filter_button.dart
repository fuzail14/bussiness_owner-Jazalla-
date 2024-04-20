import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/constants.dart';

// ignore: must_be_immutable
class FilterButton extends StatelessWidget {
  FilterButton({super.key, required this.name, required this.isSelected});
  String name;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: const Color(0xffD9D9D9)),
          color: isSelected ? const Color(0xff28B9EB) : whiteColor),
      height: 33.h,
      //width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: AutoSizeText(
              name,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? whiteColor : const Color(0xff454544)),
            ),
          ),
          Icon(
            isSelected ? Icons.close : Icons.add,
            color: isSelected ? whiteColor : const Color(0xff28B9EB),
            size: 18,
          )
        ],
      ),
    );
  }
}
