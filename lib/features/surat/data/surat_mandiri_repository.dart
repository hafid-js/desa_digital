abstract class SuratMandiriRepository {
  Future<void> kirim(Map<String, dynamic> data);
}

class SuratMandiriRepositoryDummy implements SuratMandiriRepository {
  final List<Map<String, dynamic>> _terkirim = [];

  List<Map<String, dynamic>> get terkirim => List.unmodifiable(_terkirim);

  @override
  Future<void> kirim(Map<String, dynamic> data) async {
    _terkirim.add(data);
  }
}

SuratMandiriRepository? _repository;

SuratMandiriRepository buildSuratMandiriRepository() =>
    _repository ??= SuratMandiriRepositoryDummy();
