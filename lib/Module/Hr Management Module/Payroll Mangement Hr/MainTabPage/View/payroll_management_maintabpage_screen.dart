// import 'package:bussines_owner/Module/Hr%20Management%20Module/Payroll%20Mangement%20Hr/Manage%20Salary/Main/View/manage_salary_main_hr_view.dart';
// import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

// // ignore: must_be_immutable
// class PayrollManagementMaintabpageScreen extends ConsumerStatefulWidget {
//   const VendorManagementMainTabPage({super.key});

//   @override
//   _PayrollManagementMaintabpageScreenState createState() =>
//       _PayrollManagementMaintabpageScreenState();
// }

// class _PayrollManagementMaintabpageScreenState
//     extends ConsumerState<PayrollManagementMaintabpageScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   int buildcheck = 0;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(
//         showBell: false,
//         showFilter: false,
//         title: "Payroll Managment",
//       ),
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Container(
//             height: 48.h,
//             color: Color(0xffF9F9F9),
//             child: TabBar(
//               controller: _tabController,
//               //unselectedLabelColor: Color.fromARGB(255, 144, 12, 12),
//               indicatorColor: const Color(0xff1F3996),
//               dividerColor: Colors.transparent,
//               indicatorSize: TabBarIndicatorSize.label,

//               tabs: [
//                 Tab(
//                     child: Text(
//                   'Manage Salary',
//                   style: GoogleFonts.poppins(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 13,
//                       color: const Color(0xff3D56A3)),
//                 )),
//                 Tab(
//                   child: Text(
//                     'PaySlip',
//                     style: GoogleFonts.poppins(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 13,
//                         color: const Color(0xff3D56A3)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: TabBarView(
//               controller: _tabController,
//               children:  [
//                 ManageSalaryMainHrView(),
//                 ManageSalaryMainHrView(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
