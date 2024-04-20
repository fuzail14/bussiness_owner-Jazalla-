
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../notifier/generated_otp_notifier.dart';

class GeneratedOtpPage extends ConsumerWidget {
  const GeneratedOtpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(generatedOtpProvider.notifier);

    final state = ref.read(generatedOtpProvider);

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
        ),
        //backgroundColor: Colors.red,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: SvgPicture.asset('assets/images/generated_otp_img.svg')),
            57.ph,
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 22).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verification Code',
                    style: GoogleFonts.montserrat(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff323232)),
                  ),
                  15.ph,
                  SizedBox(
                    width: 300.w,
                    child: Text(
                      'We have sent the verification code to your email address',
                      style: GoogleFonts.montserrat(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffB6B6B6)),
                      maxLines: 2,
                    ),
                  ),
                  58.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      otpBox(text: '8'),
                      otpBox(text: '5'),
                      otpBox(text: '9'),
                      otpBox(text: '3'),
                    ],
                  ),
                ],
              ),
            ),
            67.ph,
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 45.h,
                width: 334.w,
                margin: const EdgeInsets.symmetric(horizontal: 40).r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff2E63A9), Color(0xff5EAACA)],
                  ),
                ),
                child: Center(
                    child: Text(
                  'Done',
                  style: GoogleFonts.montserrat(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: whiteColor),
                )),
              ),
            )
          ],
        ));
  }
}

Widget otpBox({required String text}) {
  return Container(
    height: 71.h,
    width: 71.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20).r,
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xff2E63A9), Color(0xff5EAACA)],
      ),
    ),
    child: Center(
      child: Container(
        height: 69.h,
        width: 69.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xff757575)),
          ),
        ),
      ),
    ),
  );
}
