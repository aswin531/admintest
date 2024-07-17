import 'package:admin_rent/controllers/calender/calender_provider.dart';
import 'package:admin_rent/view/dashboard/calendar/date_ytil.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';

class CustomCalendar extends StatelessWidget {
  const CustomCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarProvider>(
      builder: (context, calendarProvider, child) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${calendarProvider.focusedDay.monthName}, ${calendarProvider.focusedDay.year}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ToggleButtons(
                            isSelected: [
                              calendarProvider.calendarFormat ==
                                  CalendarFormat.week,
                              calendarProvider.calendarFormat ==
                                  CalendarFormat.month,
                            ],
                            onPressed: (index) {
                              calendarProvider.setCalendarFormat(index == 0
                                  ? CalendarFormat.week
                                  : CalendarFormat.month);
                            },
                            color: Colors.black,
                            selectedColor: Colors.white,
                            fillColor: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text('Week'),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text('Month'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: calendarProvider.focusedDay,
                      calendarFormat: calendarProvider.calendarFormat,
                      selectedDayPredicate: (day) {
                        return isSameDay(calendarProvider.selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        calendarProvider.setSelectedDay(selectedDay);
                        calendarProvider.setFocusedDay(focusedDay);
                      },
                      headerVisible: false,
                      daysOfWeekStyle: const DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        weekendStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      calendarStyle: const CalendarStyle(
                        cellPadding: EdgeInsets.all(8.0),
                        defaultTextStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        weekendTextStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        todayTextStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        todayDecoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        outsideTextStyle: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
