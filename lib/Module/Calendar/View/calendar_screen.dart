import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Module/Calendar/Notifier/calendar_notifier.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendarState = ref.watch(calendarProvider);
    final calendarNotifier = ref.read(calendarProvider.notifier);
    final CalendarController _calendarController = CalendarController();

    _calendarController.view = calendarState.calendarView;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: MyAppBar(
        title: 'Calendar',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    calendarNotifier.setCalendarView(CalendarView.day);
                    _calendarController.view = CalendarView.day;
                  },
                  child: Text('Day'),
                ),
                ElevatedButton(
                  onPressed: () {
                    calendarNotifier.setCalendarView(CalendarView.week);
                    _calendarController.view = CalendarView.week;
                  },
                  child: Text('Week'),
                ),
                ElevatedButton(
                  onPressed: () {
                    calendarNotifier.setCalendarView(CalendarView.month);
                    _calendarController.view = CalendarView.month;
                  },
                  child: Text('Month'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20).r,
              child: SfCalendar(
                controller: _calendarController,
                view: calendarState.calendarView,
                todayTextStyle: GoogleFonts.poppins(
                    fontSize: 16.sp, fontWeight: FontWeight.bold),
                headerHeight: 75.h,
                headerStyle: CalendarHeaderStyle(
                  backgroundColor: const Color(0xff1F3996).withOpacity(0.4),
                  textStyle: FontManagment().poppins24,
                ),
                backgroundColor: whiteColor,
                dataSource: MeetingDataSource(_getDataSource()),
                monthViewSettings: MonthViewSettings(
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment,
                  showAgenda: true,
                  agendaItemHeight: 75.h,
                ),
                todayHighlightColor: Colors.blueAccent,
                onViewChanged: (ViewChangedDetails details) {
                  // Handle view change logic here if needed
                },
                monthCellBuilder:
                    (BuildContext context, MonthCellDetails details) {
                  return Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.7), width: 0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          details.date.day.toString(),
                          style: GoogleFonts.poppins(
                              color: blackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        if (details.appointments.isNotEmpty)
                          ...details.appointments.map((appointment) {
                            return Container(
                              width: double.infinity,
                              height: 5,
                            );
                          }).toList(),
                      ],
                    ),
                  );
                },
                appointmentBuilder:
                    (BuildContext context, CalendarAppointmentDetails details) {
                  final Meeting meeting = details.appointments.first;
                  return GestureDetector(
                    onTap: () => _showAppointmentDetails(context, meeting),
                    child: Container(
                      width: details.bounds.width,
                      height: details.bounds.height,
                      decoration: BoxDecoration(
                        color: meeting.background,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          meeting.eventName,
                          style: GoogleFonts.poppins(
                              color: whiteColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();

    final DateTime startTime1 =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime1 = startTime1.add(const Duration(hours: 2));
    meetings.add(
        Meeting('Project Plan', startTime1, endTime1, Colors.purple, false));

    final DateTime startTime2 =
        DateTime(today.year, today.month, today.day + 1, 12, 0, 0);
    final DateTime endTime2 = startTime2.add(const Duration(hours: 2));
    meetings.add(
        Meeting('General Meeting', startTime2, endTime2, Colors.green, false));

    final DateTime startTime3 =
        DateTime(today.year, today.month, today.day + 2, 15, 0, 0);
    final DateTime endTime3 = startTime3.add(const Duration(hours: 2));
    meetings.add(
        Meeting('Performance Check', startTime3, endTime3, Colors.red, false));

    return meetings;
  }

  void _showAppointmentDetails(BuildContext context, Meeting meeting) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(meeting.eventName),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Start: ${meeting.from}"),
              Text("End: ${meeting.to}"),
              Text("Description: Example description here."),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
