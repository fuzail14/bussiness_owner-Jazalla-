import 'package:animate_do/animate_do.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../Constants/constants.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/register_controller.dart';

class CheckPhoneNumber extends ConsumerWidget {
  const CheckPhoneNumber({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(checkPhoneNumberProvider.notifier);
    final state = ref.watch(checkPhoneNumberProvider);

    return Scaffold(
      body: Stack(children: [
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
              FadeInUp(
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
              FadeInDown(
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
              FadeInRight(
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
          padding: EdgeInsets.only(top: 40.h, left: 20, right: 20).r,
          width: double.infinity,
          height: 557.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30).r, color: Colors.white),
          child: SingleChildScrollView(
            child: Form(
              key: controller.key,
              child: Column(
                children: [
                  Text(
                    'Enter Your Phone No',
                    style: GoogleFonts.montserrat(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000)),
                  ),
                  30.ph,
                  MyTextFormField(
                    height: 52.h,
                    width: 372.w,
                    validator: validatePhoneNumber,
                    controller: controller.phoneNumberController,
                    textInputType: TextInputType.number,
                    hintText: 'Phone Number',
                    labelText: 'Phone Number',
                    labelTextColor: HexColor('#75788D'),
                    fillColor: HexColor('#FFFFFF'),
                    prefixIcon: Container(
                      // height: 52.h,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),
                        // border: Border.symmetric(
                        //   vertical: BorderSide(
                        //       color: HexColor('#EFEFEF'), width: 2),

                        //)
                      ),
                      child: GestureDetector(
                          onTap: () {
                            _showCountryPicker(context, ref);
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 16, 8, 0),
                            child: Text(
                              "${state.countryFlag} + ${state.countryCode}",
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          )),
                    ),
                    onTap: () {},
                  ),
                  90.ph,
                  MyButton(
                    width: 324.w,

                    height: 50.h,
                    name: 'Next',
                    color: HexColor('#4CB5D0'),
                    //textColor: HexColor('#8518FF'),
                    loading: state.isLoading,
                    onPressed: () {
                      if (controller.key.currentState!.validate()) {
                        state.phoneNumber =
                            "+${state.countryCode}${controller.phoneNumberController.text}";
                        if (!state.isLoading) {
                          controller.verifyUserPhoneNumber(context);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  void _showCountryPicker(BuildContext context, WidgetRef ref) {
    final controller = ref.read(checkPhoneNumberProvider.notifier);
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
        flagSize: 30,
        backgroundColor: Colors.white,
        textStyle: GoogleFonts.montserrat(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        bottomSheetHeight: 500,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
        inputDecoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
            ),
          ),
          labelStyle: GoogleFonts.montserrat(
            color: HexColor('#B6B6B6'),
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: Icon(
            Icons.search,
            color: primaryColor,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
            ),
          ),
        ),
      ),
      onSelect: (Country country) {
        controller.updateCountry(country.flagEmoji, country.phoneCode);
      },
    );
  }
}
