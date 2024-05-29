import 'dart:ui';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class CustomGlassCardScreen extends ConsumerWidget {
  CustomGlassCardScreen({
    super.key,
    required this.mainTitle,
    required this.children,
    this.showBackButton = false,
  });
  bool showBackButton;
  final String mainTitle;
  List<Widget> children = <Widget>[];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.only(top: 63, right: 0).r,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff2751A1), Color(0xff4BB3CF)])),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                if (showBackButton) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 5).r,
                    child: InkWell(
                      onTap: () {
                        print('asuhuas');
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: SvgPicture.asset(
                          'assets/images/back_button1.svg',
                        ),
                      ),
                    ),
                  )
                ],
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    mainTitle!,
                    style: FontManagment().poppins18,
                  ),
                ),
                Positioned(
                  right: 24,
                  child: InkWell(
                    onTap: () {
                      GoRouter.of(context).pushNamed(notificationsScreen);
                    },
                    child: badges.Badge(
                        badgeContent: Text('3',
                            style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xffFFFFFF))),
                        position:
                            badges.BadgePosition.topEnd(top: -5, end: -12),
                        showBadge: true,
                        ignorePointer: false,
                        child: SvgPicture.asset(
                          'assets/images/bellicon.svg',
                        )),
                  ),
                ),
              ],
            ),
            35.ph,
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)).r,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: 327.w,
                  padding: const EdgeInsets.only(
                          left: 17, top: 22, right: 20, bottom: 56)
                      .r,
                  margin: const EdgeInsets.only(
                          left: 24, top: 0, right: 24, bottom: 30)
                      .r,
                  decoration: BoxDecoration(
                      color: const Color(0xffF6F6F6).withOpacity(0.15),
                      border: Border.all(
                          width: 1,
                          color: const Color(0xffF6F6F6).withOpacity(0.5)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(40)).r),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}