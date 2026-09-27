import 'package:desa_digital/core/constants/app_colors.dart';
import 'package:desa_digital/features/surat/controllers/pengunggah_lampiran.dart';
import 'package:desa_digital/features/surat/utils/validasi_lampiran.dart';
import 'package:desa_digital/features/surat/models/permohonan_surat.dart';
import 'package:desa_digital/features/surat/models/jenis_surat.dart';
import 'package:desa_digital/features/surat/models/warga_negara.dart';
import 'package:desa_digital/features/surat/models/pendidikan.dart';
import 'package:desa_digital/features/surat/models/jenis_kelamin.dart';
import 'package:desa_digital/features/surat/models/status_perkawinan.dart';
import 'package:desa_digital/features/surat/models/pekerjaan.dart';
import 'package:desa_digital/features/surat/models/data_penduduk.dart';
import 'package:desa_digital/features/surat/models/agama.dart';
import 'package:desa_digital/features/surat/utils/hitung_umur.dart';
import 'package:desa_digital/features/surat/utils/validasi_nik.dart';
import 'package:desa_digital/features/surat/widgets/address_text_field.dart';
import 'package:desa_digital/features/surat/widgets/kolom_dropdown_surat.dart';
import 'package:desa_digital/features/surat/widgets/kolom_teks_surat.dart';
import 'package:desa_digital/features/surat/widgets/date_field.dart';
import 'package:desa_digital/features/surat/widgets/field_label.dart';
import 'package:desa_digital/features/surat/widgets/daftar_lampiran_surat.dart';
import 'package:desa_digital/features/surat/widgets/kartu_meta_surat.dart';
import 'package:desa_digital/features/surat/widgets/section_header.dart';
import 'package:flutter/material.dart';

class KeteranganDomisiliScreen extends StatefulWidget {
  const KeteranganDomisiliScreen({super.key});

  @override
  State<KeteranganDomisiliScreen> createState() =>
      _KeteranganDomisiliScreenState();
}

class _KeteranganDomisiliScreenState extends State<KeteranganDomisiliScreen> {
  static const _type = JenisSurat.domicile;

  final _nik = TextEditingController();
  final _name = TextEditingController();
  final _birthPlace = TextEditingController();
  final _birthDate = TextEditingController();
  final _address = TextEditingController();
  final _familyCardNumber = TextEditingController();
  final _familyHeadName = TextEditingController();
  final _purpose = TextEditingController();

  final _gender = ValueNotifier<JenisKelamin?>(null);
  final _religion = ValueNotifier<Agama?>(null);
  final _maritalStatus = ValueNotifier<StatusPerkawinan?>(null);
  final _education = ValueNotifier<Pendidikan?>(null);
  final _occupation = ValueNotifier<Pekerjaan?>(null);
  final _citizenship = ValueNotifier<WargaNegara?>(null);
  final _age = ValueNotifier<String?>(null);

  final _attachments = <String, PengunggahLampiran>{
    "Foto KTP": PengunggahLampiran(),
    "Kartu Keluarga": PengunggahLampiran(),
    "Surat Pernyataan Alamat Domisili": PengunggahLampiran(),
  };

  final _formKey = GlobalKey<FormState>();

  DateTime? _birthDateValue;

  void _setBirthDate(DateTime? value) {
    _birthDateValue = value;
    _birthDate.text = value == null ? '' : HitungUmur.formatTanggal(value);
    _age.value = value == null ? null : HitungUmur.formatTahunSejak(value);
  }

  String? _required(String? value, String label) =>
      (value ?? '').trim().isEmpty ? '$label wajib diisi' : null;

  String? _validateNik(String? value) => ValidasiNik.validate(value);

  String? _validateBirthDate(String? value) {
    if ((value ?? '').trim().isEmpty) return 'Tanggal lahir wajib diisi';
    if (_birthDateValue == null) return 'Tanggal lahir tidak valid';
    if (_birthDateValue!.isAfter(DateTime.now())) {
      return 'Tanggal lahir tidak boleh di masa depan';
    }
    return null;
  }

  String? _validatePurpose(String? value) {
    final text = (value ?? '').trim();
    if (text.isEmpty) return null;
    if (text.length < 10) {
      return 'Tuliskan keperluan minimal 10 karakter';
    }
    return null;
  }

  String? _validateFamilyCard(String? value) {
    final text = (value ?? '').trim();
    if (text.isEmpty) return 'Nomor KK wajib diisi';
    if (text.length != 16 || !RegExp(r'^\d+$').hasMatch(text)) {
      return 'Nomor KK harus 16 digit angka';
    }
    return null;
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final belumLengkap = cariLampiranWajibYangBelumDiunggah(
      _type,
      _attachments,
    );
    if (belumLengkap.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Lampiran wajib belum diunggah: ${belumLengkap.join(', ')}",
          ),
        ),
      );
      return;
    }

    final request = PermohonanDomisili(
      citizen: DataPenduduk(
        nik: _nik.text.trim(),
        name: _name.text.trim(),
        birthPlace: _birthPlace.text.trim(),
        birthDate: _birthDateValue,
        gender: _gender.value,
        occupation: _occupation.value,
        address: _address.text.trim(),
      ),
      religion: _religion.value!,
      maritalStatus: _maritalStatus.value!,
      education: _education.value!,
      occupation: _occupation.value!,
      citizenship: _citizenship.value!,
      familyCardNumber: _familyCardNumber.text.trim(),
      familyHeadName: _familyHeadName.text.trim(),
      purpose: _purpose.text.trim(),
    );

    debugPrint('Data ${_type.code}: ${request.toMap()}');
    _showSuccessDialog();
  }

  void _showSuccessDialog() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Permohonan Diterima"),
        content: Text(
          "Permohonan ${_type.title} dengan kode ${_type.code} "
          "telah dikirim ke petugas desa untuk diverifikasi.\n\n"
          "Surat berlaku ${_type.masaBerlakuBulan} bulan sejak diterbitkan.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Selesai"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nik.dispose();
    _name.dispose();
    _birthPlace.dispose();
    _birthDate.dispose();
    _address.dispose();
    _familyCardNumber.dispose();
    _familyHeadName.dispose();
    _purpose.dispose();
    _gender.dispose();
    _religion.dispose();
    _maritalStatus.dispose();
    _education.dispose();
    _occupation.dispose();
    _citizenship.dispose();
    _age.dispose();
    for (final controller in _attachments.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_type.title, style: Theme.of(context).textTheme.titleLarge),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KartuMetaSurat(type: _type),
                const SectionHeader("Data Pemohon"),
                const FieldLabel("NIK"),
                KolomTeksSurat(
                  label: "Contoh: 3306132208990002",
                  controller: _nik,
                  validator: _validateNik,
                  isNumber: true,
                  maxLength: ValidasiNik.length,
                ),
                const FieldLabel("Nama Lengkap"),
                KolomTeksSurat(
                  label: "Nama Lengkap",
                  controller: _name,
                  validator: (v) => _required(v, "Nama lengkap"),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FieldLabel("Tempat Lahir"),
                          KolomTeksSurat(
                            label: "Contoh: Purworejo",
                            controller: _birthPlace,
                            validator: (v) => _required(v, "Tempat lahir"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FieldLabel("Tanggal Lahir"),
                          DateField(
                            controller: _birthDate,
                            validator: _validateBirthDate,
                            pickDate: _pickBirthDate,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ValueListenableBuilder<String?>(
                  valueListenable: _age,
                  builder: (context, value, _) => Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Text(
                        'Umur: ${value ?? '-'} tahun',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ),
                ),
                const FieldLabel("Jenis Kelamin"),
                KolomDropdownSurat<JenisKelamin>(
                  label: "Jenis Kelamin",
                  items: JenisKelamin.values,
                  value: _gender,
                  validator: (v) =>
                      v == null ? "Jenis kelamin wajib dipilih" : null,
                  itemBuilder: (_, item) =>
                      Text(item.label, style: const TextStyle(fontSize: 14)),
                ),
                const FieldLabel("Agama"),
                KolomDropdownSurat<Agama>(
                  label: "Agama",
                  items: Agama.values,
                  value: _religion,
                  validator: (v) => v == null ? "Agama wajib dipilih" : null,
                  itemBuilder: (_, item) =>
                      Text(item.label, style: const TextStyle(fontSize: 14)),
                ),
                const FieldLabel("Status Perkawinan"),
                KolomDropdownSurat<StatusPerkawinan>(
                  label: "Status Perkawinan",
                  items: StatusPerkawinan.values,
                  value: _maritalStatus,
                  validator: (v) =>
                      v == null ? "Status perkawinan wajib dipilih" : null,
                  itemBuilder: (_, item) =>
                      Text(item.label, style: const TextStyle(fontSize: 14)),
                ),
                const FieldLabel("Pendidikan Terakhir"),
                KolomDropdownSurat<Pendidikan>(
                  label: "Pendidikan",
                  items: Pendidikan.values,
                  value: _education,
                  validator: (v) =>
                      v == null ? "Pendidikan wajib dipilih" : null,
                  itemBuilder: (_, item) =>
                      Text(item.label, style: const TextStyle(fontSize: 14)),
                ),
                const FieldLabel("Pekerjaan"),
                KolomDropdownSurat<Pekerjaan>(
                  label: "Pekerjaan",
                  items: Pekerjaan.values,
                  value: _occupation,
                  validator: (v) =>
                      v == null ? "Pekerjaan wajib dipilih" : null,
                  itemBuilder: (_, item) =>
                      Text(item.label, style: const TextStyle(fontSize: 14)),
                ),
                const FieldLabel("Kewarganegaraan"),
                KolomDropdownSurat<WargaNegara>(
                  label: "Kewarganegaraan",
                  items: WargaNegara.values,
                  value: _citizenship,
                  validator: (v) =>
                      v == null ? "Kewarganegaraan wajib dipilih" : null,
                  itemBuilder: (_, item) =>
                      Text(item.label, style: const TextStyle(fontSize: 14)),
                ),
                const FieldLabel("Alamat / Tempat Tinggal"),
                AddressTextField(
                  hint:
                      "Contoh: Dukuh Krajan RT003 RW001, "
                      "Desa Gunung Condong, Kecamatan Bruno",
                  controller: _address,
                  validator: (v) => _required(v, "Alamat"),
                ),
                const SizedBox(height: 8),
                const SectionHeader(
                  "Kartu Keluarga",
                  subtitle: "Sesuai Keterangan Domisili bagian pencatatan KK",
                ),
                const FieldLabel("Nomor Kartu Keluarga"),
                KolomTeksSurat(
                  label: "Contoh: 3306132208990001",
                  controller: _familyCardNumber,
                  validator: _validateFamilyCard,
                  isNumber: true,
                  maxLength: 16,
                ),
                const FieldLabel("Nama Kepala Keluarga"),
                KolomTeksSurat(
                  label: "Nama Kepala Keluarga",
                  controller: _familyHeadName,
                  validator: (v) => _required(v, "Nama kepala keluarga"),
                ),
                const SectionHeader(
                  "Keperluan Surat",
                  subtitle:
                      "Satu-satunya isian bebas pada Surat Keterangan Domisili",
                ),
                AddressTextField(
                  hint:
                      "Contoh: Persyaratan pendaftaran sekolah anak, "
                      "pengambilan berkas administrasi desa",
                  controller: _purpose,
                  validator: _validatePurpose,
                ),
                const SizedBox(height: 8),
                const SectionHeader("Lampiran Persyaratan"),
                DaftarLampiranSurat(type: _type, controllers: _attachments),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Simpan",
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickBirthDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _birthDateValue ?? now,
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null) _setBirthDate(picked);
  }
}
