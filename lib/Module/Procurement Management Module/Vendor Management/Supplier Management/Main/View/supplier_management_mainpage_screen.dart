import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../../Data/Api Resp/api_response.dart';
import '../../../../../../Widgets/Loader/loader.dart';
import '../../../../../ProcurementManagment/RFI/Main/View/procurement_soi_screen.dart';
import '../../../../../SalesManagment/RFIMain/RFI/Controller/sales_managment_rfi_controller.dart';
import '../../AddSupplier/Notifier/add_supplier_notifier.dart';
import '../../AddSupplier/View/add_supplier_screen.dart';
import '../../SupplierRecievedInvitation/View/supplier_recieved_invitation_screen.dart';
import '../Notifier/supplier_management_mainpage_notifier.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class SupplierManagementTabPage extends ConsumerWidget {
  const SupplierManagementTabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //print('build check  ${buildcheck++}');
    final controller = ref.watch(addSupplierProvider.notifier);
    final state = ref.watch(addSupplierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 23.w, right: 23.w, top: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                tabButton(
                  title: 'Add Supplier',
                  index: 0,
                  isSelected: state.selectedIndex == 0,
                  onTap: () {
                    controller.setTabBarStatus(0);
                  },
                ),
                tabButton(
                  title: 'Received Invitation',
                  index: 1,
                  isSelected: state.selectedIndex == 1,
                  onTap: () {
                    controller.setTabBarStatus(1);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: state.selectedIndex,
              children: [
                AddSupplierScreen(),
                SupplierRecievedInvitationScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
