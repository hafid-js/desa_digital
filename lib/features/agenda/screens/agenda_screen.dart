import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/features/agenda/data/event_agenda.dart';
import 'package:desa_digital/features/agenda/widgets/kartu_agenda.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
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
    initializeDateFormatting('id_ID', null).then((_) {
      if (mounted) setState(() {});
    });
  }

  List<EventAgenda> _eventTanggal(DateTime day) => eventPadaTanggal(day);

  TableCalendar _buildKalender() {
    return TableCalendar(
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
        titleTextStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        formatButtonVisible: true,
      ),
      calendarStyle: CalendarStyle(
        defaultTextStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        weekendTextStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        todayDecoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: AppColors.primary.withAlpha(130),
          shape: BoxShape.circle,
        ),
      ),
      eventLoader: _eventTanggal,
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
        return day.isAfter(DateTime.now().subtract(const Duration(days: 1))) ||
            isSameDay(day, DateTime.now());
      },
    );
  }

  Widget _buildDaftarEvent(List<EventAgenda> events) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${events.length} Event",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 18),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: events.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: KartuAgenda(event: events[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final events = _selectedDay == null
        ? const <EventAgenda>[]
        : _eventTanggal(_selectedDay!);

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
            padding: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(color: AppColors.grey.withAlpha(35)),
            child: _buildKalender(),
          ),
          if (_selectedDay != null) Expanded(child: _buildDaftarEvent(events)),
        ],
      ),
    );
  }
}
