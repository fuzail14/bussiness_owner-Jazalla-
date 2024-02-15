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
  VerificationCode({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verificationCodeState = ref.watch(verificationCodeProvider);
    final verificationCodeController =
        ref.read(verificationCodeProvider.notifier);
    final checkPhoneNumberState = ref.watch(checkPhoneNumberProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40, bottom: 21, left: 100).r,
                height: 200.h,
                width: 200.w,
                child: Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0, top: 50),
                        child: Image.asset(
                          'assets/images/jazalla.png',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 80, top: 70),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Jazalla',
                              style: GoogleFonts.mulish(
                                color: HexColor('#8518FF'),
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Business platform ',
                              style: GoogleFonts.mulish(
                                color: HexColor('#8518FF'),
                                fontSize: 14,
                                fontWeight: FontWeight.w200,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0, top: 10),
                        child: SvgPicture.asset(
                          'assets/images/mobile_circle3.svg',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 200, top: 10),
                        child: SvgPicture.asset(
                          'assets/images/mobile_circle2.svg',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0, top: 200),
                        child: SvgPicture.asset(
                          'assets/images/mobile_circle1.svg',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 200, top: 174),
                        child: SvgPicture.asset(
                          'assets/images/mobile_circle4.svg',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 135.h,
                  margin: EdgeInsets.only(top: 272.h),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xff18d4e7), Color(0xff8518ff)],
                      ))),
              Container(
                  margin: EdgeInsets.only(top: 335.h),
                  width: double.infinity,
                  height: 557.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white)),
              Form(
                key: verificationCodeController.key,
                child: Padding(
                  padding: EdgeInsets.only(top: 380.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Enter the OTP code",
                        style: GoogleFonts.poppins(
                          color: HexColor('#000000'),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      11.ph,
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(
                                  0, 0, 0, 0.4) // Default text color
                              ),
                          children: <TextSpan>[
                            TextSpan(text: "Code sent via SMS to "),
                            TextSpan(
                              text: "${checkPhoneNumberState.phoneNumber}",
                              style: TextStyle(
                                  color: Color.fromRGBO(133, 24, 255,
                                      0.65) // Dynamic number color
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Pinput(
                          validator: otpValidator,
                          length: 6,
                          controller:
                              verificationCodeController.otpCodeController,
                          onCompleted: (val) {
                            verificationCodeController.updateOtpCode(val);
                          },
                          pinAnimationType: PinAnimationType.fade,
                          defaultPinTheme: PinTheme(
                            width: 56.w,
                            height: 56.h,
                            textStyle: GoogleFonts.poppins(
                              color: HexColor('#000000'),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: HexColor('#8518FF')),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          focusedPinTheme: PinTheme(
                            width: 56.w,
                            height: 56.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(133, 24, 255, 1)),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          submittedPinTheme: PinTheme(
                            width: 56.w,
                            height: 56.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(133, 24, 255, 1)),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                      ),
                      30.ph,
                      MyButton(
                          width: 324.w,
                          height: 50.h,
                          color: HexColor('#8518FF'),
                          loading: verificationCodeState.isLoading,
                          name: 'Next',
                          onPressed: () {
                            if (verificationCodeController.key.currentState!
                                .validate()) {
                              if (!verificationCodeState.isLoading) {
                                print(
                                    verificationCodeController.verificatioCode);

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
      ),
    );
  }
}
