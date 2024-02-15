import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar(
      {super.key,
      this.title,
      this.bellOnTap,
      this.size,
      this.showBell = true,
      this.filterOnPressed});
  String? title;
  void Function()? bellOnTap;
  var size;
  bool showBell;
  void Function()? filterOnPressed;

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      toolbarHeight: size,
      title: Text(
        title!,
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500, fontSize: 18.sp, color: Colors.white),
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[Color(0xff23c2ea), Color(0xff792efd)],
          ),
        ),
      ),
      actions: [
        if (showBell) ...[
          GestureDetector(
            onTap: bellOnTap,
            child: Container(
                margin: const EdgeInsets.only(right: 30).r,
                child: SvgPicture.asset('assets/images/bellicon.svg')),
          )
        ] else ...[
          IconButton(
              icon: SvgPicture.asset(
                'assets/images/filter.svg',
                color: Colors.white,
              ),
              onPressed: filterOnPressed),
        ]
      ],
    );
  }
}
