import '../../../Data/Api Resp/api_response.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarState {
  final CalendarView calendarView;

  CalendarState({this.calendarView = CalendarView.month});

  CalendarState copyWith({CalendarView? calendarView}) {
    return CalendarState(calendarView: calendarView ?? this.calendarView);
  }
}
