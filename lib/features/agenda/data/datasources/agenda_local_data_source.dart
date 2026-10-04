import 'package:desa_digital/core/constants/app_assets.dart';
import 'package:desa_digital/features/agenda/domain/entities/event_agenda.dart';

/// Sumber data lokal acara desa, dikunci per tanggal (UTC) agar cocok dengan
/// kunci yang dipakai [TableCalendar.eventLoader].
abstract interface class AgendaDataSource {
  List<EventAgenda> eventsOn(DateTime day);
}

class AgendaLocalDataSource implements AgendaDataSource {
  const AgendaLocalDataSource();

  @override
  List<EventAgenda> eventsOn(DateTime day) =>
      eventsData[DateTime.utc(day.year, day.month, day.day)] ?? const [];
}

const EventAgenda _tazkia = EventAgenda(
  title: 'Kampung Ramadhan Tazkia 1447 H',
  image: AppAssets.event1,
  date: '01-28 Februari 2026',
);

const EventAgenda _umkm = EventAgenda(
  title: 'Festival UMKM Jateng 2026',
  image: AppAssets.event2,
  date: '05-20 Februari 2026',
);

const EventAgenda _tabligh = EventAgenda(
  title: 'Tabligh Akbar Bersama Para tokoh Nasional.',
  image: AppAssets.event3,
  date: '25 Februari 2026',
);

const EventAgenda _takjil = EventAgenda(
  title: 'Rame Rame Gelaran Takjil',
  image: AppAssets.event4,
  date: '25 Februari 2026',
);

const EventAgenda _jalanSehat = EventAgenda(
  title: 'Jalan Sehat Desa Gunung Condong',
  image: AppAssets.event5,
  date: '25 Februari 2026',
);

final Map<DateTime, List<EventAgenda>> eventsData = {
  DateTime.utc(2026, 9, 17): [_tazkia, _umkm],
  DateTime.utc(2026, 10, 2): [_tabligh, _takjil, _jalanSehat, _jalanSehat],
};
