import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Notifier/notification_notifier.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<NotificationItem> notifications = ref.watch(notificationsProvider);

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: MyAppBar(
        title: 'Notifications',
        showBell: false,
        showFilter: false,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          NotificationItem item = notifications[index];

          return Container(
              padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 24, bottom: 14)
                  .r,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20).r,
              decoration: BoxDecoration(
                color: item.isRead
                    ? Colors.white
                    : Color.fromRGBO(237, 243, 255, 0.5),
              ),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 10.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                        color: item.isRead ? Colors.white : Color(0xff2E70E8),
                        shape: BoxShape.circle),
                  ),
                  5.pw,
                  SizedBox(
                    height: 48.h,
                    width: 48.w,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(item.leading),
                    ),
                  ),
                  12.pw,
                  SizedBox(
                    width: 180.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              color: Color(0xff1E293B),
                              fontWeight: FontWeight.w600),
                        ),
                        8.ph,
                        Text(
                          item.subtitle,
                          style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              color: Color(0xff334155),
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  12.pw,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        item.time,
                        style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: Color(0xff475569),
                            fontWeight: FontWeight.w300),
                      ),
                      4.ph,
                      Icon(
                        Icons.more_horiz,
                        color: Color(0xff1E293B),
                        size: 18.w,
                      )
                    ],
                  ),
                ],
              )
              //  ListTile(
              //   leading: CircleAvatar(
              //     backgroundImage: NetworkImage(item.leading),
              //   ),
              //   title: Text(
              //     item.title,
              //     style: GoogleFonts.inter(
              //         fontSize: 14.sp,
              //         color: Color(0xff1E293B),
              //         fontWeight: FontWeight.w600),
              //   ),
              //   subtitle: Text(
              //     item.subtitle,
              //     style: GoogleFonts.inter(
              //         fontSize: 14.sp,
              //         color: Color(0xff334155),
              //         fontWeight: FontWeight.w300),
              //   ),
              //   trailing: Text(item.time),
              //   tileColor: item.isRead
              //       ? Colors.white
              //       : Color.fromRGBO(237, 243, 255, 0.5),
              //   onTap: () {
              //     ref.read(notificationsProvider.notifier).markAsRead(index);
              //     // Navigate to the dedicated screen for this notification
              //   },
              // ),
              );
        },
      ),
    );
  }
}
