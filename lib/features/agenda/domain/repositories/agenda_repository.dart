import 'package:desa_digital/core/result/result.dart';
import 'package:desa_digital/features/agenda/domain/entities/event_agenda.dart';

/// Kontrak sumber data acara pada tanggal tertentu.
abstract interface class AgendaRepository {
  Result<List<EventAgenda>> eventsOn(DateTime day);
}
