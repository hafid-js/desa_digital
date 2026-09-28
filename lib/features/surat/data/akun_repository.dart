import 'package:desa_digital/features/surat/data/penduduk_repository.dart';
import 'package:desa_digital/features/surat/models/penduduk.dart';

abstract class AkunRepository {
  Future<Penduduk?> profilAktif();
}

class AkunRepositoryDummy implements AkunRepository {
  @override
  Future<Penduduk?> profilAktif() async {
    final daftar = PendudukRepositoryDummy.daftar;
    return daftar.isEmpty ? null : daftar.first;
  }
}

AkunRepository? _repository;

AkunRepository buildAkunRepository() => _repository ??= AkunRepositoryDummy();
