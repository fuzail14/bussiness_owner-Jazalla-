import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../Constants/Person/person.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getUserSharedPreferencesData();
  }

  void getUserSharedPreferencesData() async {
    Person person = await MySharedPreferences.getUserData();

    if (person.data!.isActive == 0) {
      Timer(const Duration(seconds: 3),
          () => context.goNamed('/CheckPhoneNumber'));
    } else {
      Timer(const Duration(seconds: 3),
          () => context.goNamed('/HomeScreen', extra: person));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: double.infinity,
            height: 237.h,
            child: Image.asset(
              'assets/images/jazalla_logo.png', fit: BoxFit.cover,
              // fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
