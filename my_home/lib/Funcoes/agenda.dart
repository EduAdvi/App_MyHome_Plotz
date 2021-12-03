import 'package:flutter/material.dart';
import 'package:my_home/globals.dart' as globals;
import 'package:my_home/main.dart';

import 'package:calendar_view/calendar_view.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Agenda_Screen extends StatefulWidget {
  const Agenda_Screen({Key? key}) : super(key: key);

  @override
  _Agenda_ScreenState createState() => _Agenda_ScreenState();
}

class _Agenda_ScreenState extends State<Agenda_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agenda')),
      body: Container(
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: Center(
            child: Column(
              children: [
                SfCalendar(
                  view: CalendarView.month,
                  dataSource: MeetingDataSource(_getDataSource()),
                  monthViewSettings: MonthViewSettings(
                      appointmentDisplayMode:
                          MonthAppointmentDisplayMode.appointment),
                )
              ],
            ),
          )),
    );
  }
}

List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  meetings
      .add(Meeting('Hoje', startTime, endTime, const Color(0xFF0F8644), false));
  return meetings;
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
