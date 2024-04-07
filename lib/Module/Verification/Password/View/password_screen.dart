import 'package:animate_do/animate_do.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bussines_owner/Module/Verification/Password/Controller/password_controller.dart';
import 'package:bussines_owner/Widgets/My%20TextForm%20Field/my_textform_field.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../Constants/constants.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../../MobileNumber/Controller/register_controller.dart';

// ignore: must_be_immutable
class PasswordScreen extends ConsumerWidget {
  final _key = GlobalKey<FormState>();

  PasswordScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(passwordProvider.notifier);
    final state = ref.watch(passwordProvider);
    final phoneNumberController =
        ref.watch(checkPhoneNumberProvider.notifier).phoneNumberController;

    print('phone num: ${phoneNumberController.text}');
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 441.h,
              padding: EdgeInsets.symmetric(vertical: 62, horizontal: 70).r,
              width: double.infinity.w,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff2C5DA7), Color(0xff49AECD)])),
              child: Column(
                children: [
                  FadeInUpBig(
                    duration: const Duration(seconds: 2),
                    child: SvgPicture.asset(
                      'assets/images/jazalla_logo.svg',
                      //width: 110.w,
                      height: 135.h,

                      fit: BoxFit.contain,

                      // set your desired height
                    ),
                  ),
                  10.ph,
                  FadeInDownBig(
                    duration: const Duration(seconds: 2),
                    child: SizedBox(
                      // width: double.infinity.w,
                      // height: 100.h,
                      child: SvgPicture.asset(
                        'assets/images/jazalla_logo_text.svg',
                        //  / width: 250.w,
                        //height: 135.h,

                        fit: BoxFit.contain,

                        // set your desired height
                      ),
                    ),
                  ),
                  10.ph,
                  FadeInRightBig(
                    duration: const Duration(seconds: 2),
                    child: Text(
                      'Statrt Journey With Jazalla',
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: whiteColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 335.h),
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 55.h).r,
              width: double.infinity,
              height: 557.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30).r,
                  color: Colors.white),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mobile Number',
                      style: GoogleFonts.poppins(
                        color: HexColor('#868686'),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    10.ph,
                    MyTextFormField(
                      padding: EdgeInsets.all(0),
                      validator: emptyStringValidator,
                      controller: phoneNumberController,

                      hintText: 'Enter Mobile Number',
                      readOnly: true,
                      labelText: 'Phone',
                      labelTextColor: HexColor('#75788D'),
                      //fillColor: HexColor('#868686'),

                      suffixIcon: Icon(Icons.phone,
                          color: Color(0xff2C5DA7)), // Add an email icon
                    ),
                    35.ph,
                    Text(
                      'Password',
                      style: GoogleFonts.poppins(
                        color: HexColor('#868686'),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    10.ph,
                    MyTextFormField(
                      padding: EdgeInsets.all(0),
                      validator: emptyStringValidator,
                      controller: controller.passwordController,
                      hintText: 'Enter Password',
                      labelText: 'Password',
                      labelTextColor: HexColor('#75788D'),
                      fillColor: HexColor('#FFFFFF'),
                      obscureText: state.isHidden ? false : true,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          controller.togglePasswordView();
                        },
                        child: Icon(
                          state.isHidden
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xff2C5DA7),
                        ),
                      ),
                    ),
                    60.71.ph,
                    MyButton(
                      loading: state.isLoading,
                      width: 286.w,
                      height: 50.h,
                      color: HexColor('#4CB5D0'),
                      name: 'Submit',
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          controller.loginApi(phoneNumberController.text,
                              controller.passwordController.text, context);
                        }
                      },
                    ),
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
