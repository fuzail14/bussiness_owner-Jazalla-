import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../Constants/Person/person.dart';
import '../../../Constants/Person/person_controller.dart';
import '../../../Constants/constants.dart';
import '../../../Data/Api Resp/api_response.dart';
import '../../../Repo/Notifications Repository/notification_repo.dart';
import '../Model/Notification.dart';

final notificationsProvider = StateNotifierProvider.autoDispose<
    NotificationsNotifier, NotificationsState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return NotificationsNotifier(person: person);
}, dependencies: [personProvider]);

class NotificationsState {
  final Status responseStatus;
  //final String Filterval;
  final List<NotificationData> notificationApiList;

  NotificationsState({
    this.responseStatus = Status.loading,
    this.notificationApiList = const [],
  });

  NotificationsState copyWith({
    Status? responseStatus,
    // String? Filterval,
    List<NotificationData>? notificationApiList,
  }) {
    return NotificationsState(
      responseStatus: responseStatus ?? this.responseStatus,
      //Filterval: Filterval ?? this.Filterval,
      notificationApiList: notificationApiList ?? this.notificationApiList,
    );
  }
}

class NotificationsNotifier extends StateNotifier<NotificationsState> {
  final Person person;
  final notificationRepository = NotificationRepository();

  NotificationsNotifier({
    required this.person,
  }) : super(NotificationsState()) {
    _initialize();
  }

  void _initialize() {
    Future.delayed(const Duration(milliseconds: 300), () {
      notificationsViewApi(bearerToken: person.Bearer!);
    });
  }

  Future<void> notificationsViewApi({required String bearerToken}) async {
    setResponseStatus(Status.loading);

    try {
      final value = await notificationRepository.notificationViewApi(
          companyId: person.data!.companyId, bearerToken: bearerToken);
      state = state.copyWith(
        notificationApiList: value.notificationData,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      myToast(
        msg: '$e ',
      );

      log(e.toString());
      log(stackTrace.toString());
    }
  }

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }

  String formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return DateFormat('MM/dd/yyyy').format(dateTime);
    }
  }

  Future<void> markNotificationAsRead(int notificationId) async {
    Map<String, String> data = {
      "id": notificationId.toString(),
    };

    notificationRepository
        .markNotificationAsRead(data)
        .then((value) async {})
        .onError((error, stackTrace) {});
  }
}



// class NotificationItem {
//   bool isRead;
//   final String title;
//   final String subtitle;
//   final String time;
//   final String leading;

//   NotificationItem({
//     this.isRead = false,
//     required this.title,
//     required this.subtitle,
//     required this.time,
//     required this.leading,
//   });
// }

// class NotificationsNotifier extends StateNotifier<List<NotificationItem>> {
//   NotificationsNotifier()
//       : super([
//           NotificationItem(
//             isRead: false,
//             title: 'Request For Information!',
//             subtitle:
//                 'Thanks for joining us. Here are some tips to get you started.',
//             time: '10m',
//             leading: 'assets/images/notification1.jpg',
//           ),
//           NotificationItem(
//             isRead: false,
//             title: 'Service Inquiry',
//             subtitle:
//                 'There will be a scheduled system update tonight at 11 PM.',
//             time: '1h',
//             leading: 'assets/images/notification2.png',
//           ),
//           NotificationItem(
//             isRead: false,
//             title: 'Request For Quotation',
//             subtitle: 'Hey, dont forget about our meeting tomorrow at 9 AM.',
//             time: '2h',
//             leading: 'assets/images/notification3.png',
//           ),
//           NotificationItem(
//             isRead: false,
//             title: 'Request For Proposal',
//             subtitle: 'Hey, dont forget about our meeting tomorrow at 9 AM.',
//             time: '2h',
//             leading: 'assets/images/notification4.jpg',
//           ),
//           NotificationItem(
//             isRead: false,
//             title: 'Request For Product',
//             subtitle: 'Hey, dont forget about our meeting tomorrow at 9 AM.',
//             time: '2h',
//             leading: 'assets/images/notification1.jpg',
//           ),
//           // ... add more items as needed
//         ]);

//   void addNotification(NotificationItem notification) {
//     state = [...state, notification];
//   }

//   void markAsRead(int index) {
//     state[index].isRead = true;
//     state = [...state];
//   }

//   // Add other methods as needed, e.g., remove, update, etc.
// }

// final notificationsProvider =
//     StateNotifierProvider<NotificationsNotifier, List<NotificationItem>>((ref) {
//   return NotificationsNotifier();
// });
