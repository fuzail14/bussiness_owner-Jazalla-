import 'dart:ui';

import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants/Person/person_controller.dart';
import '../../../Routes/set_routes.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../Controller/menu_controller.dart';
import 'dart:math' as math;

class Menu extends ConsumerWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuItems = ref.watch(menuControllerProvider).menuItems;
    final person = ref.read(personProvider);
    return Scaffold(
      appBar: MyAppBar(
        title: 'Menu',
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 20,
          right: 20,
        ).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu',
              style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Color(0xff000000),
              ),
            ),
            10.ph,
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return _buildExpansionTile(context, ref, item, index, person);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionTile(
      BuildContext context, WidgetRef ref, MenuItem item, int index, person) {
    // Assuming you have a way to access the expanded state for each index

    final int? expandedIndex = ref.watch(expandedStateProvider);
    bool isExpanded = expandedIndex == index;
    // Your existing code to determine children based on item
    List<Widget> children = _buildChildrenForItem(context, item, person);
    Color iconColor = isExpanded ? Colors.white : Color(0xff1A1A1A);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: isExpanded
            ? LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff1F3996), Color(0xff4EBBD3)],
              )
            : null, // No gradient when not expanded
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          expansionTileTheme: ExpansionTileThemeData(
            backgroundColor: Colors.transparent,
          ),
        ),
        child: ExpansionTile(
          leading: SvgPicture.asset(
            item.iconPath,
            color: iconColor,
          ),
          title: Text(
            item.title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: isExpanded ? whiteColor : Color(0xff1A1A1A),
            ),
          ),
          trailing: Transform.rotate(
            angle: isExpanded ? math.pi / 2 : 0, // Rotate icon if expanded
            child: Icon(Icons.chevron_right,
                color: isExpanded ? Colors.white : Color(0xff1A1A1A)),
          ),
          onExpansionChanged: (bool expanded) {
            if (expanded) {
              ref.read(expandedStateProvider.notifier).toggle(index);
            }
          },
          children: children,
        ),
      ),
    );
  }

  List<Widget> _buildChildrenForItem(
      BuildContext context, MenuItem item, person) {
    // Decide which children to build based on the item title or any other attribute
    List<Widget> children = [];
    if (item.title == 'Procurement Management') {
      children.addAll([
        _buildListItem(context, 'RFI / SOI Management', () {
          context.pushNamed(procuremenetSoiScreen, extra: person);
        }),
        _buildListItem(context, 'RFQ Management', () {
          context.pushNamed(procuremenetRFQScreen, extra: person);
        }),
        _buildListItem(context, 'RFP Management', () {
          context.pushNamed(procurementRFPScreen, extra: person);
        }),
      ]);
    } else if (item.title == 'Sales Management') {
      children.addAll([
        _buildListItem(context, 'RFI Management', () {
          context.pushNamed(salesManagmentRFIScreen, extra: person);
        }),
        _buildListItem(context, 'RFQ Management', () {
          context.pushNamed(salesManagmentRFQScreen, extra: person);
        }),
      ]);
    } else if (item.title == 'Services Management') {
      children.addAll([
        _buildListItem(context, 'RFI Management', () {
          context.pushNamed(serviceManagmentRFIScreen, extra: person);
        }),
        _buildListItem(context, 'RFP Management', () {
          context.pushNamed(serviceManagmentRFPScreen, extra: person);
        }),
      ]);
    }

    return children;
  }

  Widget _buildListItem(
      BuildContext context, String title, VoidCallback onTap) {
    return Container(
      color: whiteColor,
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff1A1A1A),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

// class Menu extends ConsumerWidget {
//   const Menu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final menuItems = ref.watch(menuControllerProvider).menuItems;
//     final person = ref.read(personProvider);

//     return Scaffold(
//       appBar: MyAppBar(
//         title: 'Menu',
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(
//           left: 20,
//           top: 20,
//           right: 20,
//         ).r,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Menu',
//               style: GoogleFonts.quicksand(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w800,
//                   color: Color(0xff000000)),
//             ),
//             10.ph,
//             Container(
//               height: 574.h,
//               color: Color(0xffE1E3E6).withOpacity(0.5),
//               child: ListView.builder(
//                 itemCount: menuItems.length,
//                 itemBuilder: (context, index) {
//                   final item = menuItems[index];
//                   return ListTile(
//                     leading: item.icon,
//                     title: Text(
//                       item.title,
//                       style: GoogleFonts.poppins(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xff1A1A1A)),
//                     ),
//                     trailing: item.trailingIcon,
//                     onTap: () {
//                       if (item.title == 'Procurement Management') {
//                         Container(
//                             height: 200,
//                             child: ExpansionTile(
//                               title: Text('Rfx Managment'),
//                             ));
//                         // _buildProcurementExpansionTile(context, ref, person);
//                       } else if (item.title == 'Sales Management') {
//                         _salesManagmentshowDialog(context, ref, person);
//                       } else if (item.title == 'Services Management') {
//                         _serviceManagmentshowDialog(context, ref, person);
//                       } else if (item.title == 'Logout') {
//                         MySharedPreferences.deleteUserData();
//                         context.pushReplacementNamed(checkPhoneNumber);
//                       }
//                     },
//                   );
//                 },
//               ),
        
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProcurementExpansionTile(
//       BuildContext context, WidgetRef ref, person) {
//     print('come');
//     final person = ref.read(personProvider);
//     return ExpansionTile(
//       title: Text(
//         'Procurement Management',
//         style: GoogleFonts.quicksand(
//           fontSize: 20.0.sp,
//           fontWeight: FontWeight.w500,
//           color: Color(0xff1A1A1A),
//         ),
//       ),
//       children: <Widget>[
//         _buildListItem(context, 'RFI / SOI Management', () {
//           context.pushNamed(procuremenetSoiScreen, extra: person);
//         }),
//         _buildListItem(context, 'RFQ Management', () {
//           context.pushNamed(procuremenetRFQScreen, extra: person);
//         }),
//         _buildListItem(context, 'RFP Management', () {
//           context.pushNamed(procurementRFPScreen, extra: person);
//         }),
//       ],
//     );
//   }

//   // void _showDialog(BuildContext context, WidgetRef ref, person) {
//   //   ExpansionTile(title: Text('Rfx Managment'));
//   //   showDialog(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return Dialog(
//   //         shape:
//   //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//   //         child: Container(
//   //           padding: EdgeInsets.all(20.0),
//   //           decoration: BoxDecoration(
//   //             color: whiteColor,
//   //             borderRadius: BorderRadius.circular(20.0),
//   //             boxShadow: [
//   //               BoxShadow(
//   //                 color: Colors.grey.withOpacity(0.5),
//   //                 spreadRadius: 2,
//   //                 blurRadius: 8,
//   //                 offset: Offset(0, 2),
//   //               ),
//   //             ],
//   //           ),
//   //           child: Column(
//   //             mainAxisSize: MainAxisSize.min,
//   //             children: [
//   //               Text(
//   //                 'Procurement Management',
//   //                 style: GoogleFonts.quicksand(
//   //                     fontSize: 20.0, fontWeight: FontWeight.w500),
//   //               ),
//   //               SizedBox(height: 20.0),
//   //               _dialogButton(
//   //                 context: context,
//   //                 title: 'RFI / SOI Management',
//   //                 onTap: () {
//   //                   Navigator.of(context).pop();
//   //                   context.pushNamed(procuremenetSoiScreen, extra: person);
//   //                 },
//   //               ),
//   //               _dialogButton(
//   //                 context: context,
//   //                 title: 'RFQ Management',
//   //                 onTap: () {
//   //                   Navigator.of(context).pop();
//   //                   context.pushNamed(procuremenetRFQScreen, extra: person);
//   //                 },
//   //               ),
//   //               _dialogButton(
//   //                 context: context,
//   //                 title: 'RFP Management',
//   //                 onTap: () {
//   //                   Navigator.of(context).pop();
//   //                   context.pushNamed(procurementRFPScreen, extra: person);
//   //                 },
//   //               ),
//   //             ],
//   //           ),
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }

//   void _salesManagmentshowDialog(BuildContext context, WidgetRef ref, person) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//           child: Container(
//             padding: EdgeInsets.all(20.0),
//             decoration: BoxDecoration(
//               color: whiteColor,
//               borderRadius: BorderRadius.circular(20.0),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 8,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'Sales Management',
//                   style: GoogleFonts.quicksand(
//                       fontSize: 20.0, fontWeight: FontWeight.w500),
//                 ),
//                 SizedBox(height: 20.0),
//                 _dialogButton(
//                   context: context,
//                   title: 'RFI / SOI Management',
//                   onTap: () {
//                     Navigator.of(context).pop();
//                     context.pushNamed(salesManagmentRFIScreen, extra: person);
//                 
//  },
//                 ),
//                 _dialogButton(
//                   context: context,
//                   title: 'RFQ Management',
//                   onTap: () {
//                     Navigator.of(context).pop();
//                     context.pushNamed(salesManagmentRFQScreen, extra: person);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _serviceManagmentshowDialog(
//       BuildContext context, WidgetRef ref, person) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//           child: Container(
//             padding: EdgeInsets.all(20.0),
//             decoration: BoxDecoration(
//               color: whiteColor,
//               borderRadius: BorderRadius.circular(20.0),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 8,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'Service Management',
//                   style: GoogleFonts.quicksand(
//                       fontSize: 20.0, fontWeight: FontWeight.w500),
//                 ),
//                 SizedBox(height: 20.0),
//                 _dialogButton(
//                   context: context,
//                   title: 'RFI / SOI Management',
//                   onTap: () {
//                     Navigator.of(context).pop();
//                     context.pushNamed(serviceManagmentRFIScreen, extra: person);
//                   },
//                 ),
//                 _dialogButton(
//                   context: context,
//                   title: 'RFP Management',
//                   onTap: () {
//                     Navigator.of(context).pop();
//                     context.pushNamed(serviceManagmentRFPScreen, extra: person);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _dialogButton(
//       {required BuildContext context,
//       required String title,
//       required VoidCallback onTap}) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         margin: EdgeInsets.only(top: 20),
//         padding: EdgeInsets.only(left: 20, right: 20).r,
//         width: 362.w,
//         height: 51.h,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12).r,
//           color: whiteColor,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 1,
//               blurRadius: 6,
//               offset: Offset(0, 1),
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: GoogleFonts.quicksand(
//                   fontSize: 16.0.sp,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xff7A7A7A)),
//             ),
//             Icon(
//               Icons.chevron_right,
//               color: Color(0xff7A7A7A),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildListItem(
//       BuildContext context, String title, VoidCallback onTap) {
//     return ListTile(
//       title: Text(
//         title,
//         style: GoogleFonts.quicksand(
//           fontSize: 16.0.sp,
//           fontWeight: FontWeight.w500,
//           color: Color(0xff1A1A1A),
//         ),
//       ),
//       onTap: onTap,
//     );
//   }

//   // ... rest of your existing methods
// }
