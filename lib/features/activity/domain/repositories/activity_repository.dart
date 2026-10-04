import 'package:desa_digital/core/result/result.dart';
import 'package:desa_digital/features/activity/domain/entities/activity_item.dart';

/// Kontrak sumber data aktivitas.
///
/// Implementasi nyata ada di data layer (`data/datasources`), sedangkan
/// domain hanya mengenal kontrak ini.
abstract interface class ActivityRepository {
  Result<List<ActivityItem>> items(ActivityFeed feed);
}
