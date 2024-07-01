import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../ProcurementManagment/RFI/Main/View/procurement_soi_screen.dart';
import '../../AddClientSales/Notifier/add_client_sales_notifier.dart';
import '../../AddClientSales/View/add_client_sales_screen.dart';
import '../../ClientRecievedInvitationSales/View/client_recieved_invitation_sales_screen.dart';
import '../Notifier/client_management_mainpage_notifier.dart';

// ignore: must_be_immutable
class ClientManagementMainTabPage extends ConsumerWidget {
  const ClientManagementMainTabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //print('build check  ${buildcheck++}');

    final mainController = ref.watch(clientManagementMainPageProvider.notifier);
    final mainstate = ref.watch(clientManagementMainPageProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: 'Client Management',
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 23.w, right: 23.w, top: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                tabButton(
                  title: 'Add Client',
                  index: 0,
                  isSelected: mainstate.selectedIndex == 0,
                  onTap: () {
                    mainController.setTabBarStatus(0);
                  },
                ),
                tabButton(
                  title: 'Received Invitation',
                  index: 1,
                  isSelected: mainstate.selectedIndex == 1,
                  onTap: () {
                    mainController.setTabBarStatus(1);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: mainstate.selectedIndex,
              children: [
                AddClientSalesScreen(),
                ClientRecievedInvitationScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
