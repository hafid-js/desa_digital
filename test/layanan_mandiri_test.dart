import 'package:desa_digital/features/surat/data/akun_repository.dart';
import 'package:desa_digital/features/surat/data/penduduk_repository.dart';
import 'package:desa_digital/features/surat/data/surat_mandiri_repository.dart';
import 'package:desa_digital/features/surat/models/katalog_surat_mandiri.dart';
import 'package:desa_digital/features/surat/screens/daftar_surat_screen.dart';
import 'package:desa_digital/features/surat/screens/formulir_surat_mandiri_screen.dart';
import 'package:desa_digital/features/surat/screens/keterangan_kelahiran_screen.dart';
import 'package:desa_digital/features/surat/screens/keterangan_kematian_screen.dart';
import 'package:desa_digital/features/surat/screens/permohonan_surat_screen.dart';
import 'package:desa_digital/features/surat/widgets/konfirmasi_pemohon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

Future<void> _aturLayar(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1080, 2400);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);
}

void main() {
  tearDown(Get.reset);

  group('Layanan Mandiri', () {
    test('katalog memuat surat mandiri OpenSID', () {
      expect(katalogSuratMandiri, hasLength(15));
      expect(suratMandiriSiap, hasLength(15));
      expect(suratPerluProses.map((item) => item.code), ['S-17', 'S-21']);
    });

    test('jumlah isian tiap surat sama persis dengan kode_isian OpenSID', () {
      const harapan = <String, int>{
        'S-41': 1,
        '500': 2,
        'S-01': 2,
        'S-02': 1,
        'S-03': 0,
        'S-07': 1,
        'S-08': 0,
        'S-10': 1,
        'S-11': 1,
        'S-12': 2,
        'S-13': 3,
        'S-16': 1,
        'S-30': 2,
        'S-43': 0,
        '471.1': 11,
      };
      for (final surat in katalogSuratMandiri) {
        expect(
          surat.fields.length + surat.fieldsIdentitasKedua.length,
          harapan[surat.code],
          reason: surat.code,
        );
      }
    });

    test('warga hanya mengetik isian surat, bukan data penduduk', () {
      for (final surat in katalogSuratMandiri) {
        if (surat.code == '471.1') continue;
        expect(
          surat.fields.length,
          lessThanOrEqualTo(3),
          reason: '${surat.code} tidak boleh meminta data penduduk manual',
        );
      }
    });

    test('hanya 471.1 yang butuh identitas kedua', () {
      final butuh = katalogSuratMandiri
          .where((item) => item.butuhIdentitasKedua)
          .map((item) => item.code);
      expect(butuh, ['471.1']);
    });

    test('semua surat mandiri punya masa berlaku 1 bulan', () {
      for (final surat in katalogSuratMandiri) {
        expect(surat.masaBerlakuBulan, 1, reason: surat.code);
      }
    });

    testWidgets('kartu jumlah surat memakai angka nyata', (tester) async {
      await _aturLayar(tester);
      await tester.pumpWidget(
        const GetMaterialApp(home: PermohonanSuratScreen()),
      );
      await tester.pumpAndSettle();

      expect(
        find.text("${suratMandiriSiap.length} Jenis Surat"),
        findsOneWidget,
      );
      expect(
        find.text("${suratPerluProses.length} Jenis Surat"),
        findsOneWidget,
      );
      expect(find.text('Surat Pernyataan'), findsNothing);
    });

    testWidgets('klik kartu Surat Mandiri membuka daftar mandiri', (
      tester,
    ) async {
      await _aturLayar(tester);
      await tester.pumpWidget(
        const GetMaterialApp(home: PermohonanSuratScreen()),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Surat Mandiri'));
      await tester.pumpAndSettle();

      expect(find.byType(DaftarSuratScreen), findsOneWidget);
      expect(find.text('Perlu Proses Desa'), findsNothing);
    });

    testWidgets('klik kartu Perlu Proses membuka daftar perlu proses', (
      tester,
    ) async {
      await _aturLayar(tester);
      await tester.pumpWidget(
        const GetMaterialApp(home: PermohonanSuratScreen()),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Perlu Proses Desa'));
      await tester.pumpAndSettle();

      expect(find.byType(DaftarSuratScreen), findsOneWidget);
      expect(find.textContaining('Surat Mandiri ('), findsNothing);
    });

    testWidgets('S-41 memakai formulir mandiri yang sama', (tester) async {
      await _aturLayar(tester);
      await tester.pumpWidget(
        GetMaterialApp(home: DaftarSuratScreen.mandiri()),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.textContaining('S-41'));
      await tester.pumpAndSettle();

      expect(find.byType(FormulirSuratMandiriScreen), findsOneWidget);
      expect(find.text('Keterangan Pemohon'), findsOneWidget);
      expect(find.text('Masa Berlaku'), findsOneWidget);
    });

    testWidgets('S-17 dan S-21 membuka formulir perlu proses', (tester) async {
      await _aturLayar(tester);
      await tester.pumpWidget(
        const GetMaterialApp(home: DaftarSuratScreen.perluProses()),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.textContaining('S-17'));
      await tester.pumpAndSettle();
      expect(find.byType(KeteranganKelahiranScreen), findsOneWidget);

      Get.back();
      await tester.pumpAndSettle();

      await tester.tap(find.textContaining('S-21'));
      await tester.pumpAndSettle();
      expect(find.byType(KeteranganKematianScreen), findsOneWidget);
    });

    testWidgets('setiap surat mandiri punya formulir yang bisa dirender', (
      tester,
    ) async {
      await _aturLayar(tester);

      for (final surat in suratMandiriSiap) {
        if (surat.code == 'S-41') continue;

        await tester.pumpWidget(
          GetMaterialApp(
            home: FormulirSuratMandiriScreen(
              key: ValueKey(surat.code),
              surat: surat,
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          find.text(surat.title),
          findsWidgets,
          reason: 'gagal merender ${surat.code}',
        );
      }
    });

    testWidgets('ganti surat di state yang sama tidak menyebabkan error', (
      tester,
    ) async {
      await _aturLayar(tester);

      for (final surat in suratMandiriSiap.where((i) => i.code != 'S-41')) {
        await tester.pumpWidget(
          GetMaterialApp(
            home: FormulirSuratMandiriScreen(
              key: ValueKey(surat.code),
              surat: surat,
            ),
          ),
        );
        await tester.pumpAndSettle();
      }
    });

    testWidgets('471.1 menampilkan blok Identitas Kedua', (tester) async {
      await _aturLayar(tester);
      final beda = suratMandiriSiap.firstWhere((i) => i.code == '471.1');

      await tester.pumpWidget(
        GetMaterialApp(home: FormulirSuratMandiriScreen(surat: beda)),
      );
      await tester.pumpAndSettle();

      expect(find.text('Identitas Kedua'), findsOneWidget);
    });

    testWidgets('surat tanpa identitas kedua tidak menampilkan blok itu', (
      tester,
    ) async {
      await _aturLayar(tester);
      final usaha = suratMandiriSiap.firstWhere((i) => i.code == '500');

      await tester.pumpWidget(
        GetMaterialApp(home: FormulirSuratMandiriScreen(surat: usaha)),
      );
      await tester.pumpAndSettle();

      expect(find.text('Identitas Kedua'), findsNothing);
    });

    testWidgets('formulir menolak isian kosong pada field wajib', (
      tester,
    ) async {
      await _aturLayar(tester);
      final s13 = suratMandiriSiap.firstWhere((item) => item.code == 'S-13');

      await tester.pumpWidget(
        GetMaterialApp(home: FormulirSuratMandiriScreen(surat: s13)),
      );
      await tester.pumpAndSettle();

      await tester.dragUntilVisible(
        find.text('Simpan'),
        find.byType(Form),
        const Offset(0, -200),
      );
      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();

      expect(find.text('Nama Barang wajib diisi'), findsOneWidget);
    });

    testWidgets('pemohon tampil read-only dari profil akun', (tester) async {
      await _aturLayar(tester);
      final s41 = suratMandiriSiap.firstWhere((item) => item.code == 'S-41');

      await tester.pumpWidget(
        GetMaterialApp(home: FormulirSuratMandiriScreen(surat: s41)),
      );
      await tester.pumpAndSettle();

      expect(find.byType(KonfirmasiPemohon), findsOneWidget);
      expect(
        find.text('Data sesuai akun Anda dan tidak dapat diubah'),
        findsOneWidget,
      );
      expect(find.byType(TextField), findsWidgets);
      final profil = await buildAkunRepository().profilAktif();
      expect(find.text(profil!.nik), findsOneWidget);
      expect(find.text(profil.nama), findsOneWidget);
    });

    testWidgets('formulir mandiri tidak punya pencarian NIK', (tester) async {
      await _aturLayar(tester);
      final s41 = suratMandiriSiap.firstWhere((item) => item.code == 'S-41');

      await tester.pumpWidget(
        GetMaterialApp(home: FormulirSuratMandiriScreen(surat: s41)),
      );
      await tester.pumpAndSettle();

      expect(find.text('Cari NIK atau nama'), findsNothing);
    });

    testWidgets('submit mengirim id profil akun ke repository', (tester) async {
      await _aturLayar(tester);
      final s41 = suratMandiriSiap.firstWhere((item) => item.code == 'S-41');

      await tester.pumpWidget(
        GetMaterialApp(home: FormulirSuratMandiriScreen(surat: s41)),
      );
      await tester.pumpAndSettle();

      await tester.dragUntilVisible(
        find.text('Simpan'),
        find.byType(Form),
        const Offset(0, -200),
      );
      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();

      final repo = buildSuratMandiriRepository() as SuratMandiriRepositoryDummy;
      final profil = await buildAkunRepository().profilAktif();
      expect(repo.terkirim, hasLength(1));
      expect(repo.terkirim.first['penduduk_id'], profil!.id);
      expect(repo.terkirim.first['kode_surat'], 'S-41');
    });
  });

  group('SuratMandiriRepository', () {
    test('dummy menyimpan payload yang dikirim', () async {
      final repo = SuratMandiriRepositoryDummy();

      await repo.kirim({'kode_surat': 'S-01'});
      await repo.kirim({'kode_surat': '500'});

      expect(repo.terkirim.map((item) => item['kode_surat']), ['S-01', '500']);
    });

    test('factory mengembalikan instance yang sama', () {
      expect(
        identical(buildSuratMandiriRepository(), buildSuratMandiriRepository()),
        isTrue,
      );
    });
  });

  group('PendudukRepository', () {
    test('mengembalikan seluruh penduduk saat kunci kosong', () async {
      final hasil = await PendudukRepositoryDummy().cari('');
      expect(hasil.length, greaterThanOrEqualTo(2));
    });

    test('mencari berdasarkan NIK', () async {
      final hasil = await PendudukRepositoryDummy().cari('3273091805650001');
      expect(hasil.map((item) => item.nama), ['Ratma Sari']);
    });

    test('mencari berdasarkan nama tidak mempeduli huruf besar', () async {
      final hasil = await PendudukRepositoryDummy().cari('budi');
      expect(hasil.map((item) => item.nama), ['Budi Hidayat']);
    });

    test('kunci yang tidak cocok mengembalikan daftar kosong', () async {
      final hasil = await PendudukRepositoryDummy().cari('zzz');
      expect(hasil, isEmpty);
    });

    test('umur dihitung dari tanggal lahir', () {
      final penduduk = PendudukRepositoryDummy.daftar.first;
      expect(penduduk.umur, isNotNull);
      expect(penduduk.labelUmur, endsWith('TAHUN'));
    });

    test('factory mengembalikan instance yang sama', () {
      expect(
        identical(buildPendudukRepository(), buildPendudukRepository()),
        isTrue,
      );
    });
  });
}
