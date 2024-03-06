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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(children: [
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
              key: controller.key,
              child: Padding(
                padding: EdgeInsets.only(top: 320.h, left: 20, right: 20).r,
                child: Column(
                  children: [
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
                        height: 52.h,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                            ),
                            border: Border.all(color: HexColor('#EFEFEF'))),
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
                      color: HexColor('#8518FF'),
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
          ]),
        ),
      ),
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
