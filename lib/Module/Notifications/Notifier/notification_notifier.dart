import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationItem {
  bool isRead;
  final String title;
  final String subtitle;
  final String time;
  final String leading;

  NotificationItem({
    this.isRead = false,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.leading,
  });
}

class NotificationsNotifier extends StateNotifier<List<NotificationItem>> {
  NotificationsNotifier()
      : super([
          NotificationItem(
            isRead: false,
            title: 'Welcome to the Platform!',
            subtitle:
                'Thanks for joining us. Here are some tips to get you started.',
            time: '10m',
            leading: 'https://impulse.aarafacademy.com/uploads/samples/b1.jpg',
          ),
          NotificationItem(
            isRead: false,
            title: 'System Update',
            subtitle:
                'There will be a scheduled system update tonight at 11 PM.',
            time: '1h',
            leading: 'https://via.placeholder.com/200',
          ),
          NotificationItem(
            isRead: false,
            title: 'New Notification from Sara',
            subtitle: 'Hey, dont forget about our meeting tomorrow at 9 AM.',
            time: '2h',
            leading: 'https://impulse.aarafacademy.com/uploads/samples/g1.jpg',
          ),
          NotificationItem(
            isRead: true,
            title: 'New Message from Samantha',
            subtitle: 'Hey, dont forget about our meeting tomorrow at 9 AM.',
            time: '2h',
            leading:
                'https://img.freepik.com/free-photo/eyes-level-shot-front-view-woman-staring_23-2148248587.jpg?size=626&ext=jpg&ga=GA1.1.1880011253.1700352000&semt=ais',
          ),
          NotificationItem(
            isRead: true,
            title: 'This is Dummy Content Message from John',
            subtitle: 'Hey, dont forget about our meeting tomorrow at 9 AM.',
            time: '2h',
            leading: 'https://via.placeholder.com/200',
          ),
          // ... add more items as needed
        ]);

  void addNotification(NotificationItem notification) {
    state = [...state, notification];
  }

  void markAsRead(int index) {
    state[index].isRead = true;
    state = [...state];
  }

  // Add other methods as needed, e.g., remove, update, etc.
}

final notificationsProvider =
    StateNotifierProvider<NotificationsNotifier, List<NotificationItem>>((ref) {
  return NotificationsNotifier();
});
