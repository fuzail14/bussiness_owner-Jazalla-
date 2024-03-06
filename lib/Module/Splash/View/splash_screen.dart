import 'dart:async';

import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                // color: Colors.amber,
                padding: const EdgeInsets.only(
                  top: 320.0,
                ).r,
                //width: 200.w, // set your desired width
                //height: 400.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInLeft(
                      duration: const Duration(seconds: 2),
                      child: Image.asset(
                        'assets/images/jazalla.png',
                        // set your desired height
                      ),
                    ),
                    20.pw,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInUp(
                          duration: const Duration(seconds: 2),
                          child: Text(
                            'Jazalla',
                            style: GoogleFonts.niramit(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color:
                                  Color(0xff455A64), // set your desired color
                            ),
                          ),
                        ),
                        FadeInDown(
                          duration: const Duration(seconds: 2),
                          child: Text(
                            'Bussines Platform',
                            style: GoogleFonts.mulish(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                              color:
                                  Color(0xff263238), // set your desired color
                            ),
                          ),
                        ),
                      ],
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
