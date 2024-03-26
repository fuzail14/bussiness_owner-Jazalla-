import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Data/Api Resp/api_response.dart';
import '../../../Routes/set_routes.dart';
import '../../../Widgets/Loader/loader.dart';
import '../Notifier/notification_notifier.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(notificationsProvider.notifier);
    final state = ref.watch(notificationsProvider);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: MyAppBar(
        title: 'Notifications',
        showBell: false,
        showFilter: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            24.ph,
            if (state.responseStatus == Status.loading)
              const Loader()
            else if (state.responseStatus == Status.completed) ...[
              if (state.notificationApiList.isEmpty) ...[
                Center(
                  child: Text(
                    'No Notifications',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: HexColor('#000000')),
                  ),
                ),
              ] else
                Expanded(
                    child: ListView.builder(
                  itemCount: state.notificationApiList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var notification = state.notificationApiList[index];
                    var dateTime = DateTime.parse(notification.createdAt!);
                    var formattedTime = controller.formatTimeAgo(dateTime);
                    return InkWell(
                        onTap: () {
                          ref
                              .read(notificationsProvider.notifier)
                              .markNotificationAsRead(notification.id!);

                          if (notification.type == 'RFQ') {
                            GoRouter.of(context).pushNamed(
                              rFXManagmentRFQDetailPage,
                              pathParameters: {
                                'id': notification.typeId.toString()
                              },
                              extra: controller.person,
                            );
                          }
                          if (notification.type == 'RFP') {
                            GoRouter.of(context).pushNamed(
                              rFXManagmentRFPDetailPage,
                              pathParameters: {
                                'id': notification.typeId.toString()
                              },
                              extra: controller.person,
                            );
                          }
                        },
                        child: Container(
                            padding: const EdgeInsets.only(
                                    left: 20, right: 0, top: 4, bottom: 14)
                                .r,
                            margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 20, bottom: 0)
                                .r,
                            decoration: BoxDecoration(
                              color: (notification.isRead == 0)
                                  ? Color.fromRGBO(237, 243, 255, 0.5)
                                  : whiteColor,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 10.h,
                                  width: 10.w,
                                  margin: EdgeInsets.only(top: 20).r,
                                  decoration: BoxDecoration(
                                      color: (notification.isRead == 0)
                                          ? Color(0xff1F3996)
                                          : Colors.white,
                                      shape: BoxShape.circle),
                                ),
                                5.pw,
                                SizedBox(
                                  height: 48.h,
                                  width: 48.w,
                                  child: SvgPicture.asset(
                                    'assets/images/jazalla_logo.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                12.pw,
                                SizedBox(
                                  width: 180.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        notification.heading.toString(),
                                        style: GoogleFonts.inter(
                                            fontSize: 14.sp,
                                            color: Color(0xff1E293B),
                                            fontWeight: FontWeight.w600),
                                      ),
                                      8.ph,
                                      Text(
                                        notification.data.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.inter(
                                            fontSize: 14.sp,
                                            color: Color(0xff334155),
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                                12.pw,
                                SizedBox(
                                  width: 30.w,
                                  child: Text(
                                    formattedTime.toString(),
                                    style: GoogleFonts.quicksand(
                                        fontSize: 10.sp,
                                        color: Color(0xff475569),
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ],
                            )));
                  },
                ))
            ] else
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "No Data Found",
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: HexColor('#EB2F2F')),
                ),
              ),
          ],
        ),
      ),
    );
  }
}




// class NotificationsScreen extends ConsumerWidget {
//   const NotificationsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     List<NotificationItem> notifications = ref.watch(notificationsProvider);

//     return Scaffold(
//       backgroundColor: whiteColor,
//       appBar: MyAppBar(
//         title: 'Notifications',
//         showBell: false,
//         showFilter: false,
//       ),
//       body: ListView.builder(
//         itemCount: notifications.length,
//         itemBuilder: (context, index) {
//           NotificationItem item = notifications[index];

//           return InkWell(
//             onTap: () {
//               ref.read(notificationsProvider.notifier).markAsRead(index);
//               // Navigate to the dedicated screen for this notification
//             },
//             child: Container(
//                 padding: const EdgeInsets.only(
//                         left: 20, right: 20, top: 4, bottom: 14)
//                     .r,
//                 margin: const EdgeInsets.only(
//                         left: 20, right: 20, top: 20, bottom: 0)
//                     .r,
//                 decoration: BoxDecoration(
//                   color: item.isRead
//                       ? Colors.white
//                       : Color.fromRGBO(237, 243, 255, 0.5),
//                 ),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   //mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 10.h,
//                       width: 10.w,
//                       margin: EdgeInsets.only(top: 20).r,
//                       decoration: BoxDecoration(
//                           color: item.isRead ? Colors.white : Color(0xff1F3996),
//                           shape: BoxShape.circle),
//                     ),
//                     5.pw,
//                     SizedBox(
//                       height: 48.h,
//                       width: 48.w,
//                       child: Image.asset(
//                         item.leading,
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                     12.pw,
//                     SizedBox(
//                       width: 180.w,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             item.title,
//                             style: GoogleFonts.inter(
//                                 fontSize: 14.sp,
//                                 color: Color(0xff1E293B),
//                                 fontWeight: FontWeight.w600),
//                           ),
//                           8.ph,
//                           Text(
//                             item.subtitle,
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: GoogleFonts.inter(
//                                 fontSize: 14.sp,
//                                 color: Color(0xff334155),
//                                 fontWeight: FontWeight.w300),
//                           ),
//                         ],
//                       ),
//                     ),
//                     12.pw,
//                     Text(
//                       item.time,
//                       style: GoogleFonts.inter(
//                           fontSize: 14.sp,
//                           color: Color(0xff475569),
//                           fontWeight: FontWeight.w300),
//                     ),
//                   ],
//                 )
//                 //  ListTile(
//                 //   leading: CircleAvatar(
//                 //     backgroundImage: NetworkImage(item.leading),
//                 //   ),
//                 //   title: Text(
//                 //     item.title,
//                 //     style: GoogleFonts.inter(
//                 //         fontSize: 14.sp,
//                 //         color: Color(0xff1E293B),
//                 //         fontWeight: FontWeight.w600),
//                 //   ),
//                 //   subtitle: Text(
//                 //     item.subtitle,
//                 //     style: GoogleFonts.inter(
//                 //         fontSize: 14.sp,
//                 //         color: Color(0xff334155),
//                 //         fontWeight: FontWeight.w300),
//                 //   ),
//                 //   trailing: Text(item.time),
//                 //   tileColor: item.isRead
//                 //       ? Colors.white
//                 //       : Color.fromRGBO(237, 243, 255, 0.5),
//                 //   onTap: () {
//                 //     ref.read(notificationsProvider.notifier).markAsRead(index);
//                 //     // Navigate to the dedicated screen for this notification
//                 //   },
//                 // ),
//                 ),
//           );
//         },
//       ),
//     );
//   }
// }
