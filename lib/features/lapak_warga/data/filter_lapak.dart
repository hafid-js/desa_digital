enum UrutanLapak {
  terbaru('terbaru', 'Paling Terbaru'),
  termurah('termurah', 'Harga Terendah'),
  termahal('termahal', 'Harga Tertinggi');

  const UrutanLapak(this.value, this.label);

  final String value;
  final String label;
}

enum StatusBarang { semua, baru, used }

class FilterLapak {
  const FilterLapak({
    this.urutan = UrutanLapak.terbaru,
    this.kategori = const <String>{},
    this.hargaMinimum,
    this.hargaMaksimum,
    this.lokasi = const <String>{},
    this.hanyaTersedia = true,
  });

  final UrutanLapak urutan;
  final Set<String> kategori;
  final int? hargaMinimum;
  final int? hargaMaksimum;
  final Set<String> lokasi;
  final bool hanyaTersedia;

  bool get aktif =>
      urutan != UrutanLapak.terbaru ||
      kategori.isNotEmpty ||
      hargaMinimum != null ||
      hargaMaksimum != null ||
      lokasi.isNotEmpty ||
      !hanyaTersedia;

  int get jumlahFilterAktif {
    var jumlah = kategori.length + lokasi.length;

    if (hargaMinimum != null || hargaMaksimum != null) jumlah++;

    return jumlah;
  }

  FilterLapak copyWith({
    UrutanLapak? urutan,
    Set<String>? kategori,
    int? hargaMinimum,
    int? hargaMaksimum,
    bool clearHargaMinimum = false,
    bool clearHargaMaksimum = false,
    Set<String>? lokasi,
    bool? hanyaTersedia,
  }) {
    return FilterLapak(
      urutan: urutan ?? this.urutan,
      kategori: kategori ?? this.kategori,
      hargaMinimum: clearHargaMinimum
          ? null
          : (hargaMinimum ?? this.hargaMinimum),
      hargaMaksimum: clearHargaMaksimum
          ? null
          : (hargaMaksimum ?? this.hargaMaksimum),
      lokasi: lokasi ?? this.lokasi,
      hanyaTersedia: hanyaTersedia ?? this.hanyaTersedia,
    );
  }
}
