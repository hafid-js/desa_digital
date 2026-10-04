import 'package:desa_digital/core/di/injector.dart';
import 'package:desa_digital/features/activity/data/datasources/activity_local_data_source.dart';
import 'package:desa_digital/features/activity/data/repositories/activity_repository_impl.dart';
import 'package:desa_digital/features/activity/domain/repositories/activity_repository.dart';
import 'package:desa_digital/features/activity/domain/usecases/get_activity_items.dart';
import 'package:desa_digital/features/activity/presentation/controllers/activity_controller.dart';
import 'package:get/get.dart';

/// Mendaftarkan dependensi activity: datasource -> repository -> use case ->
/// controller.
///
/// Controller didaftarkan `permanent` karena Aktivitas bisa dibuka dari tab
/// MainShell maupun dari route terpisah; satu instance dipakai keduanya.
class ActivityBinding extends Bindings {
  @override
  void dependencies() {
    Injector.register<ActivityDataSource>(
      ActivityLocalDataSource.new,
      lazy: true,
      permanent: true,
    );

    Injector.register<ActivityRepository>(
      () => ActivityRepositoryImpl(Injector.resolve<ActivityDataSource>()),
      lazy: true,
      permanent: true,
    );

    Injector.register<GetActivityItems>(
      () => GetActivityItems(Injector.resolve<ActivityRepository>()),
      lazy: true,
      permanent: true,
    );

    Injector.register<ActivityController>(
      () => ActivityController(Injector.resolve<GetActivityItems>()),
      lazy: true,
      permanent: true,
    );
  }
}
