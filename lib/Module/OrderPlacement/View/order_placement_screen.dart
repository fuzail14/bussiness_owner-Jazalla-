import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ProcurementManagment/RFI/Main/Controller/procurement_soi_controller.dart';
import '../../ProcurementManagment/RFI/Main/View/procurement_soi_screen.dart';
import '../../ProcurementManagment/RFP/Main/Controller/procurement_rfp_controller.dart';
import '../../ProcurementManagment/RFP/Main/View/procurement_rfp_screen.dart';
import '../../ProcurementManagment/RFQ/Main/View/procurement_rfq_screen.dart';
import '../../SalesManagment/RFIMain/RFI/Controller/sales_managment_rfi_controller.dart';
import '../../SalesManagment/RFQMain/RFQ/Controller/sales_managment_rfq_controller.dart';
import '../../ServiceManagment/RFPMain/RFP/Controller/service_managment_rfp_controller.dart';

// ignore: must_be_immutable
class OrderPlacementScreen extends ConsumerStatefulWidget {
  const OrderPlacementScreen({super.key});

  @override
  _OrderPlacementScreenState createState() => _OrderPlacementScreenState();
}

class _OrderPlacementScreenState extends ConsumerState<OrderPlacementScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int buildcheck = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build check  ${buildcheck++}');
    final controller = ref.watch(ProcuremenetSoiProvider.notifier);
    final state = ref.watch(ProcuremenetSoiProvider);
    final salesManagmentRFPcontroller =
        ref.watch(SalesManagmentRFIProvider.notifier);
    final salesManagmentRFPstate = ref.watch(SalesManagmentRFIProvider);
    final ProcuremenetSoiProviderController =
        ref.watch(ProcuremenetSoiProvider.notifier);
    final ProcuremenetSoiProviderState = ref.watch(ProcuremenetSoiProvider);
    final salesManagmentRFQ = ref.watch(salesManagmentRFQProvider.notifier);
    final salesManagmentRFQstate = ref.watch(salesManagmentRFQProvider);

    final ProcuremenetRFpProviderController =
        ref.watch(ProcuremenetRFpProvider.notifier);
    final ProcuremenetRFpProviderState = ref.watch(ProcuremenetRFpProvider);
    final serviceManagmentRFPcontroller =
        ref.watch(serviceManagmentRFPProvider.notifier);
    final serviceManagmentRFPstate = ref.watch(serviceManagmentRFPProvider);

    return Scaffold(
      appBar: MyAppBar(
        showBell: false,
        showFilter: false,
        title: "Order Managment",
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            //margin: EdgeInsets.only(left: 23.w, right: 23.w, top: 30).w,
            // width: 362.w,
            height: 48.h,
            // decoration: ShapeDecoration(
            //     color: const Color(0xff4EBBD3).withOpacity(0.2),
            //     shape: RoundedRectangleBorder(
            //       side: BorderSide(width: 1.w, color: const Color(0xff4EBBD3)),
            //       borderRadius: BorderRadius.circular(8.r),
            //     )
            //     )
            //     ,
            child: TabBar(
              controller: _tabController,
              unselectedLabelColor: const Color(0xFF5A5A5A),
              indicatorColor: const Color(0xff1F3996),

              indicatorSize: TabBarIndicatorSize.tab,

              //  labelColor: Colors.white,
              // indicator: ShapeDecoration(

              //   color: HexColor('#1F3996'),
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(6.r)),
              // ),

              tabs: [
                Tab(
                    child: Text(
                  'RFI',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: const Color(0xff3D56A3)),
                )),
                Tab(
                  child: Text(
                    'RFQ',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: const Color(0xff3D56A3)),
                  ),
                ),
                Tab(
                  child: Text(
                    'RFP',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
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
                ProcuremenetSoiScreen(),
                ProcurementRFQScreen(),
                ProcurementRFPScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
