import 'dart:async';

import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/Person/person.dart';
import '../../../Constants/Person/person_controller.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenConsumerState createState() => _SplashScreenConsumerState();
}

class _SplashScreenConsumerState extends ConsumerState<SplashScreen> {
  PersonController? personController;

  @override
  void initState() {
    super.initState();
    getUserSharedPreferencesData();
  }

  void getUserSharedPreferencesData() async {
    Person person = await MySharedPreferences.getUserData();
    ref.read(personProvider.notifier).setPerson(person);

    if (person.data!.companyId == 0) {
      Timer(const Duration(seconds: 3),
          () => context.goNamed('/CheckPhoneNumber'));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => context.goNamed(
                '/HomeScreen',
                //extra: person
              ));
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
            FadeInUp(
              duration: const Duration(seconds: 2),
              child: SizedBox(
                // width: double.infinity.w,
                // height: 100.h,
                child: SvgPicture.asset(
                  'assets/images/jazalla_logo.svg',
                  //width: 110.w,
                  height: 135.h,

                  fit: BoxFit.contain,

                  // set your desired height
                ),
              ),
            ),
            FadeInLeft(
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
            // FadeInUp(
            //   duration: const Duration(seconds: 2),
            //   child: Text(
            //     'Jazalla',
            //     style: GoogleFonts.montserrat(
            //       fontSize: 36.sp,
            //       fontWeight: FontWeight.bold,
            //       color: whiteColor, // set your desired color
            //     ),
            //   ),
            // ),

            20.ph,
            FadeInDown(
              duration: const Duration(seconds: 2),
              child: Text(
                'Statrt Journey With Jazalla',
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
