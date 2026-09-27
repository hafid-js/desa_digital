import 'package:desa_digital/features/pengaduan/data/sumber_data_wilayah.dart';
import 'package:desa_digital/features/pengaduan/domain/entities/wilayah.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PencarianWilayahController extends GetxController {
  final SumberDataWilayah _dataSource = SumberDataWilayah();

  final searchController = TextEditingController();
  final FixedExtentScrollController scrollController =
      FixedExtentScrollController();
  final RxList<Wilayah> results = <Wilayah>[].obs;
  final RxBool isLoading = false.obs;
  final RxInt selectedIndex = 0.obs;

  static const int minChars = 3;
  static const double itemExtent = 40;

  List<Wilayah>? _allRegions;
  Map<String, Wilayah>? _byCode;

  Future<void> onQueryChanged(String query) async {
    final keyword = query.trim().toLowerCase();

    if (keyword.length < minChars) {
      results.clear();
      return;
    }

    isLoading.value = true;

    try {
      await _ensureLoaded();

      final matches =
          _allRegions!
              .where(
                (region) =>
                    region.level >= 2 &&
                    region.name.toLowerCase().contains(keyword),
              )
              .toList()
            ..sort((a, b) {
              if (a.level != b.level) return a.level.compareTo(b.level);
              return a.name.toLowerCase().compareTo(b.name.toLowerCase());
            });

      results.value = matches;
      selectedIndex.value = 0;
      if (scrollController.hasClients) {
        scrollController.jumpToItem(0);
      }
    } catch (_) {
      results.clear();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _ensureLoaded() async {
    if (_allRegions != null) return;

    final regions = await _dataSource.loadRegions();
    _allRegions = regions;
    _byCode = {for (final r in regions) r.code: r};
  }

  void syncSelection() {
    if (results.isEmpty || !scrollController.hasClients) return;

    final item = scrollController.selectedItem.clamp(0, results.length - 1);
    if (item != selectedIndex.value) {
      selectedIndex.value = item;
    }
  }

  ScrollPosition? _attachedPosition;

  void attachScrollListener() {
    if (!scrollController.hasClients) return;

    final position = scrollController.position;
    if (_attachedPosition == position) return;

    _attachedPosition?.removeListener(syncSelection);
    position.addListener(syncSelection);
    _attachedPosition = position;
  }

  Wilayah? get selectedRegion {
    if (results.isEmpty) return null;
    if (selectedIndex.value < 0 || selectedIndex.value >= results.length) {
      return null;
    }
    return results[selectedIndex.value];
  }

  String pathOf(Wilayah region) {
    final names = <String>[];
    Wilayah? current = region;

    while (current != null) {
      if (current.level >= 2) names.add(current.name);
      current = current.parentCode.isEmpty
          ? null
          : _byCode?[current.parentCode];
    }

    return names.reversed.map((name) => name.toUpperCase()).join(', ');
  }

  String? get fullLocation {
    final selected = selectedRegion;
    if (selected == null) return null;
    return pathOf(selected);
  }

  void clear() {
    searchController.clear();
    results.clear();
    isLoading.value = false;
    selectedIndex.value = 0;
  }

  @override
  void onClose() {
    _attachedPosition?.removeListener(syncSelection);
    searchController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
