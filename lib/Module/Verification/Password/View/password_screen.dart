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

    final phoneNumbercontroller = ref.read(checkPhoneNumberProvider.notifier);

    print('phone num ${phoneNumbercontroller.phoneNumberController.text}');
    return Scaffold(
      body: SafeArea(
        child: Center(
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
                  key: _key,
                  child: Padding(
                    padding: EdgeInsets.only(left: 51, top: 370.h).r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                          controller:
                              phoneNumbercontroller.phoneNumberController,

                          hintText: 'Enter Mobile Number',
                          readOnly: true,
                          labelText: 'Phone',
                          labelTextColor: HexColor('#75788D'),
                          //fillColor: HexColor('#868686'),

                          suffixIcon: Icon(Icons.phone,
                              color: HexColor('#8518FF')), // Add an email icon
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
                              color: HexColor('#8518FF'),
                            ),
                          ),
                        ),
                        30.71.ph,
                        MyButton(
                          loading: state.isLoading,
                          width: 286.w,
                          height: 50.h,
                          color: HexColor('#8518FF'),
                          name: 'Submit',
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              controller.loginApi(
                                  phoneNumbercontroller
                                      .phoneNumberController.text,
                                  controller.passwordController.text,
                                  context);
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
        ),
      ),
    );
  }
}
