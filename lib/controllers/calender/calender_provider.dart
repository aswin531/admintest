import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarProvider extends ChangeNotifier {
  DateTime _focusedDay = DateTime.now();
   DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime get focusedDay => _focusedDay;
  DateTime get selectedDay => _selectedDay;
  CalendarFormat get calendarFormat => _calendarFormat;

  void setFocusedDay(DateTime day) {
    _focusedDay = day;
    notifyListeners();
  }

  void setSelectedDay(DateTime? day) {
    _selectedDay = day!;
    notifyListeners();
  }

  void setCalendarFormat(CalendarFormat calendarFormat) {
    _calendarFormat = calendarFormat;
    notifyListeners();
  }
}
