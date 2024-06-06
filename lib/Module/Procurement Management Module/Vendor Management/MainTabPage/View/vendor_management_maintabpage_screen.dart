import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../ProcurementManagment/RFI/Main/View/procurement_soi_screen.dart';
import '../../../../ProcurementManagment/RFP/Main/View/procurement_rfp_screen.dart';
import '../../../../ProcurementManagment/RFQ/Main/View/procurement_rfq_screen.dart';
import '../../Service provider Management/Main/View/service_provider_management_mainpage_screen.dart';
import '../../Supplier Management/Main/View/supplier_management_mainpage_screen.dart';

// ignore: must_be_immutable
class VendorManagementMainTabPage extends ConsumerStatefulWidget {
  const VendorManagementMainTabPage({super.key});

  @override
  _VendorManagementMainTabPageState createState() =>
      _VendorManagementMainTabPageState();
}

class _VendorManagementMainTabPageState
    extends ConsumerState<VendorManagementMainTabPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int buildcheck = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        showBell: false,
        showFilter: false,
        title: "Vendor Managment",
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 48.h,
            color: Color(0xffF9F9F9),
            child: TabBar(
              controller: _tabController,
              //unselectedLabelColor: Color.fromARGB(255, 144, 12, 12),
              indicatorColor: const Color(0xff1F3996),
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.label,

              tabs: [
                Tab(
                    child: Text(
                  'Supplier Management',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: const Color(0xff3D56A3)),
                )),
                Tab(
                  child: Text(
                    'Services Provider ',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: const Color(0xff3D56A3)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                SupplierManagementTabPage(),
                ServiceProviderManagementTabPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
