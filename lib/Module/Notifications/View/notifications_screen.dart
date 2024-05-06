import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
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
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
                              salesManagmentRFQDetailPage,
                              pathParameters: {
                                'id': notification.typeId.toString()
                              },
                              extra: controller.person,
                            );
                          }
                          if (notification.type == 'RFP') {
                            GoRouter.of(context).pushNamed(
                              serviceManagmentRFPDetailPage,
                              pathParameters: {
                                'id': notification.typeId.toString()
                              },
                              extra: controller.person,
                            );
                          }
                          if (notification.type == 'ServiceInquiry') {
                            GoRouter.of(context).pushNamed(
                              serviceManagmentRFIDetailPage,
                              pathParameters: {
                                'id': notification.typeId.toString()
                              },
                              extra: controller.person,
                            );
                          }
                          if (notification.type == 'ProductInquiry') {
                            GoRouter.of(context).pushNamed(
                              salesManagmentRFIDetailPage,
                              pathParameters: {
                                'id': notification.typeId.toString()
                              },
                              extra: controller.person,
                            );
                          }
                        },
                        child: Container(
                          width: 375.w,
                          padding: (notification.isRead == 0)
                              ? const EdgeInsets.only(
                                      left: 10, right: 0, top: 24, bottom: 0)
                                  .r
                              : const EdgeInsets.only(
                                      left: 20, right: 0, top: 24, bottom: 0)
                                  .r,
                          margin: const EdgeInsets.only(
                                  left: 0, right: 0, top: 0, bottom: 0)
                              .r,
                          decoration: BoxDecoration(
                            color: (notification.isRead == 0)
                                ? const Color.fromRGBO(237, 243, 255, 0.5)
                                : whiteColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (notification.isRead == 0) ...[
                                    Container(
                                      height: 8.h,
                                      width: 8.w,
                                      margin: const EdgeInsets.only(
                                              top: 20, left: 5)
                                          .r,
                                      decoration: BoxDecoration(
                                          color: (notification.isRead == 0)
                                              ? const Color(0xff2E70E8)
                                              : Colors.white,
                                          shape: BoxShape.circle),
                                    ),
                                  ],
                                  5.pw,
                                  // if (notification.type == 'RFQ') ...[
                                  SizedBox(
                                    height: 48.h,
                                    width: 48.w,
                                    child: SvgPicture.asset(
                                      'assets/images/general_service.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  //]
                                  //else if (notification.type == 'RFP') ...[
                                  //   SizedBox(
                                  //     height: 48.h,
                                  //     width: 48.w,
                                  //     child: SvgPicture.asset(
                                  //       'assets/images/tendercard_icon2.svg',
                                  //       fit: BoxFit.contain,
                                  //     ),
                                  //   ),
                                  // ] else if (notification.type ==
                                  //     'ServiceInquiry') ...[
                                  //   SizedBox(
                                  //     height: 48.h,
                                  //     width: 48.w,
                                  //     child: SvgPicture.asset(
                                  //       'assets/images/tenders.svg',
                                  //       fit: BoxFit.contain,
                                  //     ),
                                  //   ),
                                  // ] else if (notification.type ==
                                  //     'ProductInquiry') ...[
                                  //   SizedBox(
                                  //     height: 48.h,
                                  //     width: 48.w,
                                  //     child: SvgPicture.asset(
                                  //       'assets/images/tick.svg',
                                  //       fit: BoxFit.contain,
                                  //     ),
                                  //   ),
                                  // ],
                                  12.pw,
                                  SizedBox(
                                    width: 200.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Text(
                                        //   notification.heading.toString(),
                                        //   style: GoogleFonts.inter(
                                        //       fontSize: 14.sp,
                                        //       color: Color(0xff1E293B),
                                        //       fontWeight: FontWeight.w600),
                                        // ),
                                        RichText(
                                          text: TextSpan(
                                            text:
                                                notification.heading.toString(),
                                            style: GoogleFonts.inter(
                                                fontSize: 16.sp,
                                                color: const Color(0xff1E293B),
                                                fontWeight: FontWeight.w700),
                                            /*defining default style is optional */
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '  Type   ',
                                                style: GoogleFonts.inter(
                                                    fontSize: 12.sp,
                                                    color:
                                                        const Color(0xff1E293B),
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              if (notification.type ==
                                                  'RFQ') ...[
                                                TextSpan(
                                                  text: 'Request For Quotation',
                                                  style: GoogleFonts.inter(
                                                      fontSize: 14.sp,
                                                      color: const Color(
                                                          0xff1E293B),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ] else if (notification.type ==
                                                  'RFP') ...[
                                                TextSpan(
                                                  text: 'Request For Proposal',
                                                  style: GoogleFonts.inter(
                                                      fontSize: 14.sp,
                                                      color: const Color(
                                                          0xff1E293B),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ] else if (notification.type ==
                                                  'ServiceInquiry') ...[
                                                TextSpan(
                                                  text:
                                                      'Request For Information For Service',
                                                  style: GoogleFonts.inter(
                                                      fontSize: 14.sp,
                                                      color: const Color(
                                                          0xff1E293B),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ] else if (notification.type ==
                                                  'ProductInquiry') ...[
                                                TextSpan(
                                                  text:
                                                      'Request For Information For Product',
                                                  style: GoogleFonts.inter(
                                                      fontSize: 14.sp,
                                                      color: const Color(
                                                          0xff1E293B),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ]
                                            ],
                                          ),
                                        ),
                                        8.ph,
                                        Text(
                                          notification.data.toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.inter(
                                              fontSize: 14.sp,
                                              color: const Color(0xff334155),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  18.pw,
                                  SizedBox(
                                    width: 50.w,
                                    child: Text(
                                      formattedTime.toString(),
                                      style: GoogleFonts.quicksand(
                                          fontSize: 10.sp,
                                          color: const Color(0xff475569),
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                              10.ph,
                              const Divider(
                                thickness: 0.5,
                                height: 0,
                              )
                            ],
                          ),
                        ));
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
