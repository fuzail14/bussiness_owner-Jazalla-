// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:badges/badges.dart' as badges;

// class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
//   HomeAppBar(
//       {super.key,
//       this.title,
//       this.bellOnTap,
//       this.size,
//       this.showBell = true,
//       this.showFilter = true,
//       this.showBackButton = true,
//       this.filterOnPressed});
//   String? title;
//   void Function()? bellOnTap;
//   var size;
//   bool showBell;
//   bool showFilter;
//   bool showBackButton;

//   void Function()? filterOnPressed;

//   @override
//   Size get preferredSize => Size.fromHeight(100);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       automaticallyImplyLeading: true,
//       // iconTheme: const IconThemeData(
//       //   color: Colors.white,
//       // ),
//       toolbarHeight: size,

//       leading: showBackButton
//           ? Padding(
//               padding: const EdgeInsets.only(top: 30),
//               child: InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: SizedBox(
//                   height: 24.h,
//                   width: 24.w,
//                   child: SvgPicture.asset(
//                     'assets/images/arrow_back.svg',
//                   ),
//                 ),
//               ),
//             )
//           : null,

//       title: Padding(
//         padding: const EdgeInsets.only(top: 30).r,
//         child: Center(
//           child: Text(
//             title!,
//             style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 18.sp,
//                 color: Colors.white),
//           ),
//         ),
//       ),
//       flexibleSpace: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.centerLeft,
//             end: Alignment.centerRight,
//             colors: <Color>[Color(0xff1F3996), Color(0xff4EBBD3)],
//           ),
//         ),
//       ),
//       actions: [
//         if (showBell) ...[
//           // GestureDetector(
//           //   onTap: bellOnTap,
//           //   child: Container(
//           //       margin: const EdgeInsets.only(right: 30).r,
//           //       child: SvgPicture.asset('assets/images/bellicon.svg')),
//           // )

//           Padding(
//             padding: const EdgeInsets.only(right: 40, top: 30).r,
//             child: InkWell(
//               onTap: () {},
//               child: badges.Badge(
//                 badgeContent: Text('3',
//                     style: GoogleFonts.roboto(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xffFFFFFF))),
//                 position: badges.BadgePosition.topEnd(top: -10, end: -12),
//                 showBadge: true,
//                 ignorePointer: false,
//                 child: SvgPicture.asset(
//                   'assets/images/bellicon.svg',
//                 ),
//               ),
//             ),
//           )
//         ] else if (showFilter) ...[
//           Padding(
//             padding: const EdgeInsets.only(right: 0, top: 20).r,
//             child: IconButton(
//                 icon: SvgPicture.asset(
//                   'assets/images/filter.svg',
//                   color: Colors.white,
//                 ),
//                 onPressed: filterOnPressed),
//           ),
//         ]
//       ],
//     );
//   }
// }
