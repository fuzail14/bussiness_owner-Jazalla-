import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinput/pinput.dart';
import '../../../../Constants/constants.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../../MobileNumber/Controller/register_controller.dart';
import '../Controller/verification_code_controller.dart';

class VerificationCode extends ConsumerWidget {
  const VerificationCode({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verificationCodeState = ref.watch(verificationCodeProvider);
    final verificationCodeController =
        ref.read(verificationCodeProvider.notifier);
    final checkPhoneNumberState = ref.watch(checkPhoneNumberProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 441.h,
              padding:
                  const EdgeInsets.symmetric(vertical: 62, horizontal: 70).r,
              width: double.infinity.w,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff2C5DA7), Color(0xff49AECD)])),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/jazalla_logo.svg',
                    //width: 110.w,
                    height: 135.h,

                    fit: BoxFit.contain,

                    // set your desired height
                  ),
                  10.ph,
                  SvgPicture.asset(
                    'assets/images/jazalla_logo_text.svg',
                    //  / width: 250.w,
                    //height: 135.h,

                    fit: BoxFit.contain,

                    // set your desired height
                  ),
                  10.ph,
                  Text(
                    'Statrt Journey With Jazalla',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: whiteColor),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 335).r,
              padding:
                  const EdgeInsets.symmetric(horizontal: 35, vertical: 35).r,
              width: double.infinity,
              height: 557.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: Form(
                key: verificationCodeController.key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Verification Code",
                      style: GoogleFonts.poppins(
                        color: HexColor('#000000'),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    11.ph,
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(
                                0, 0, 0, 0.4) // Default text color
                            ),
                        children: <TextSpan>[
                          const TextSpan(text: "Code sent via SMS to"),
                          TextSpan(
                            text: checkPhoneNumberState.phoneNumber,
                            style: const TextStyle(
                                color: Color(0xff2C5DA7) // Dynamic number color
                                ),
                          ),
                        ],
                      ),
                    ),
                    45.ph,
                    Pinput(
                      showCursor: true,
                      isCursorAnimationEnabled: true,
                      validator: otpValidator,
                      length: 6,
                      controller: verificationCodeController.otpCodeController,
                      onCompleted: (val) {
                        verificationCodeController.updateOtpCode(val);
                      },
                      pinAnimationType: PinAnimationType.fade,
                      defaultPinTheme: PinTheme(
                        width: 44.w,
                        height: 44.h,
                        textStyle: GoogleFonts.poppins(
                          color: HexColor('#000000'),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff2C5DA7)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 56.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff2C5DA7)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      submittedPinTheme: PinTheme(
                        width: 56.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff2C5DA7)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                    102.ph,
                    MyButton(
                        width: 324.w,
                        height: 50.h,
                        color: HexColor('#4CB5D0'),
                        loading: verificationCodeState.isLoading,
                        name: 'Next',
                        onPressed: () {
                          if (verificationCodeController.key.currentState!
                              .validate()) {
                            if (!verificationCodeState.isLoading) {
                              print(verificationCodeController.verificatioCode);

                              verificationCodeController.verifyUserOtp(
                                  context,
                                  verificationCodeController
                                      .otpCodeController.text,
                                  checkPhoneNumberState.verificationId);
                            }
                          }
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
