import 'package:desa_digital/features/aduan/domain/entities/region.dart';
import 'package:flutter/services.dart';

class WilayahLocalDataSource {
  Future<List<Region>> loadRegions() async {
    final provinces = await _parse('data/provinces.csv');
    final regencies = await _parse('data/regencies.csv');
    final districts = await _parse('data/districts.csv');
    final villages = await _parse('data/villages.csv');

    return [
      ...provinces.map(
        (r) => Region(code: r[0], parentCode: '', name: r[1], level: 1),
      ),
      ...regencies.map(
        (r) => Region(code: r[0], parentCode: r[1], name: r[2], level: 2),
      ),
      ...districts.map(
        (r) => Region(code: r[0], parentCode: r[1], name: r[2], level: 3),
      ),
      ...villages.map(
        (r) => Region(code: r[0], parentCode: r[1], name: r[2], level: 4),
      ),
    ];
  }

  Future<List<List<String>>> _parse(String asset) async {
    final raw = await rootBundle.loadString(asset);
    return raw
        .trim()
        .split('\n')
        .map((line) => line.split(','))
        .toList();
  }
}