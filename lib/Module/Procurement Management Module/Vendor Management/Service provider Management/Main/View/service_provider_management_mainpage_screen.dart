import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../ProcurementManagment/RFI/Main/View/procurement_soi_screen.dart';
import '../../AddServiceProvider/Notifier/add_service_provider_notifier.dart';
import '../../AddServiceProvider/View/add_service_provider_screen.dart';
import '../../ServiceRecievedInvitation/View/service_provider_recieved_invitation_screen.dart';

// ignore: must_be_immutable
class ServiceProviderManagementTabPage extends ConsumerWidget {
  const ServiceProviderManagementTabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //print('build check  ${buildcheck++}');
    final controller = ref.watch(addAddServiceProvider.notifier);
    final state = ref.watch(addAddServiceProvider);

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
                  title: 'Add Provider',
                  index: 0,
                  isSelected: state.selectedIndex == 0,
                  onTap: () {
                    controller.setTabBarStatus(0);
                  },
                ),
                tabButton(
                  title: 'Received Provider',
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
                AddServiceProviderScreen(),
                ServiceProviderRecievedInvitationScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
