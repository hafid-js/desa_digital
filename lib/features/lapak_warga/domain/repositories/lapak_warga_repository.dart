import 'package:desa_digital/core/result/result.dart';
import 'package:desa_digital/features/lapak_warga/domain/entities/opsi_lapak.dart';
import 'package:desa_digital/features/lapak_warga/domain/entities/produk_lapak.dart';

abstract interface class LapakWargaRepository {
  /// Produk yang ditampilkan pada grid lapak warga.
  Result<List<ProdukLapak>> loadProduk();

  /// Opsi filter dan opsi form posting lapak.
  Result<OpsiLapak> loadOpsi();
}
