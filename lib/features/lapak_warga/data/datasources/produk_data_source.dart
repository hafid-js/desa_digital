import 'package:desa_digital/features/lapak_warga/domain/entities/produk_lapak.dart';

/// Produk contoh untuk mengisi grid Lapak Warga.
class ProdukDataSource {
  const ProdukDataSource();

  static const int jumlahContoh = 8;

  List<ProdukLapak> loadProduk() =>
      List<ProdukLapak>.generate(jumlahContoh, (_) => _produkContoh);

  static const ProdukLapak _produkContoh = ProdukLapak(
    title: "Columbia Women's Castback TC PFG Shoes",
    price: "31.800",
    originalPrice: "150.000",
    discount: "-55%",
    seller: "Sumanto",
    location: "Dusun Karangsari",
    image: "assets/images/lapak_warga/handphone.png",
    userAvatar: "assets/images/lapak_warga/user_example.jpg",
    description:
        "Sepatu berkualitas hasil karya warga lokal desa. Nyaman dipakai untuk aktivitas sehari-hari, awet, dan tahan lama.",
  );
}
