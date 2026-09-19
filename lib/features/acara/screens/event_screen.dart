import 'package:desa_digital/features/acara/data/datasources/event_data.dart';
import 'package:desa_digital/features/acara/widgets/event_card.dart';
import 'package:desa_digital/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.utc(
      _focusedDay.year,
      _focusedDay.month,
      _focusedDay.day,
    );
    initializeDateFormatting('id_ID', null).then((_) => setState(() {}));
  }

  List<Map<String, String>> _getEventsForDay(DateTime day) {
    return eventsData[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Acara", style: Theme.of(context).textTheme.titleLarge),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(color: Colors.grey.withAlpha(35)),
            child: TableCalendar(
              firstDay: DateTime(2000),
              lastDay: DateTime(2100),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              availableCalendarFormats: const {
                CalendarFormat.month: 'Bulanan',
                CalendarFormat.twoWeeks: '2 Mingguan',
                CalendarFormat.week: 'Mingguan',
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              headerVisible: true,
              headerStyle: HeaderStyle(
                titleTextStyle: Theme.of(context).textTheme.labelMedium!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w400),

                formatButtonVisible: true,
              ),
              calendarStyle: CalendarStyle(
                defaultTextStyle: Theme.of(context).textTheme.labelMedium!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w300),
                weekendTextStyle: Theme.of(context).textTheme.labelMedium!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w300),
                todayDecoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: AppColors.primary.withAlpha(130),
                  shape: BoxShape.circle,
                ),
              ),
              eventLoader: _getEventsForDay,
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, date, events) {
                  if (events.isNotEmpty) {
                    return Positioned(
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: AppColors.primary,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
              enabledDayPredicate: (day) {
                return day.isAfter(
                      DateTime.now().subtract(const Duration(days: 1)),
                    ) ||
                    isSameDay(day, DateTime.now());
              },
            ),
          ),

          if (_selectedDay != null)
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14),
                  ),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${_getEventsForDay(_selectedDay!).length} Event",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _getEventsForDay(_selectedDay!).length,
                        itemBuilder: (context, index) {
                          final event = _getEventsForDay(_selectedDay!)[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12),
                            child: EventCard(event: event),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
