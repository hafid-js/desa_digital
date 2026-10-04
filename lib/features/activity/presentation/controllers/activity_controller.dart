import 'package:desa_digital/features/activity/domain/entities/activity_item.dart';
import 'package:desa_digital/features/activity/domain/usecases/get_activity_items.dart';
import 'package:get/get.dart';

/// Menyediakan data untuk layer presentation (tab Laporan Saya dan Disimpan).
///
/// Data dimuat sinkron di [onInit] supaya frame pertama sudah terisi, tanpa
/// state loading yang sebelumnya tidak ada di layar ini.
class ActivityController extends GetxController {
  ActivityController(this._getActivityItems);

  final GetActivityItems _getActivityItems;

  final List<ActivityItem> laporanProses = <ActivityItem>[];
  final List<ActivityItem> laporanSelesai = <ActivityItem>[];
  final List<ActivityItem> keluhanTersimpan = <ActivityItem>[];
  final List<ActivityItem> beritaTersimpan = <ActivityItem>[];

  /// Pesan kegagalan terakhir, `null` bila semua feed berhasil dimuat.
  final RxnString pesanGagal = RxnString();

  @override
  void onInit() {
    super.onInit();
    _muat(ActivityFeed.laporanProses, laporanProses);
    _muat(ActivityFeed.laporanSelesai, laporanSelesai);
    _muat(ActivityFeed.keluhanTersimpan, keluhanTersimpan);
    _muat(ActivityFeed.beritaTersimpan, beritaTersimpan);
  }

  void _muat(ActivityFeed feed, List<ActivityItem> target) {
    _getActivityItems(feed).fold(
      onSuccess: target.addAll,
      onFailure: (failure) => pesanGagal.value = failure.message,
    );
  }
}
