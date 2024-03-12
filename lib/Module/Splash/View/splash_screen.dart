import 'dart:async';

import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/Person/person.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getUserSharedPreferencesData();
  }

  void getUserSharedPreferencesData() async {
    Person person = await MySharedPreferences.getUserData();

    print(person.data!.companyId);

    if (person.data!.companyId == 0) {
      Timer(const Duration(seconds: 3),
          () => context.goNamed('/CheckPhoneNumber'));
    } else {
      Timer(const Duration(seconds: 3),
          () => context.goNamed('/HomeScreen', extra: person));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff1F3996), Color(0xff4EBBD3)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FadeInLeft(
              duration: const Duration(seconds: 2),
              child: SvgPicture.asset(
                'assets/images/jazalla_logo.svg',
                width: 117.w,
                height: 135.h,
                // set your desired height
              ),
            ),
            FadeInUp(
              duration: const Duration(seconds: 2),
              child: Text(
                'Jazalla',
                style: GoogleFonts.montserrat(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                  color: whiteColor, // set your desired color
                ),
              ),
            ),
            10.ph,
            FadeInRight(
              duration: const Duration(seconds: 2),
              child: Text(
                'Bussines Platform',
                style: GoogleFonts.mulish(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: whiteColor,
                ),
              ),
            ),
            20.ph,
            FadeInDown(
              duration: const Duration(seconds: 2),
              child: Text(
                'Statrt Journey With Jazallah',
                style: GoogleFonts.mulish(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
