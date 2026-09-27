import 'package:desa_digital/features/surat/models/jenis_kelamin.dart';
import 'package:desa_digital/features/surat/models/pekerjaan.dart';
import 'package:desa_digital/features/surat/models/data_penduduk.dart';
import 'package:desa_digital/features/surat/utils/hitung_umur.dart';
import 'package:desa_digital/features/surat/utils/validasi_nik.dart';
import 'package:desa_digital/features/surat/widgets/address_text_field.dart';
import 'package:desa_digital/features/surat/widgets/kolom_dropdown_surat.dart';
import 'package:desa_digital/features/surat/widgets/kolom_teks_surat.dart';
import 'package:desa_digital/features/surat/widgets/date_field.dart';
import 'package:desa_digital/features/surat/widgets/field_label.dart';
import 'package:flutter/material.dart';

class DataOrangForm {
  DataOrangForm({
    this.requireNik = true,
    this.requireBirthDate = true,
    this.withGender = false,
  });

  final bool requireNik;
  final bool requireBirthDate;
  final bool withGender;

  final nik = TextEditingController();
  final name = TextEditingController();
  final birthPlace = TextEditingController();
  final birthDate = TextEditingController();
  final address = TextEditingController();

  final gender = ValueNotifier<JenisKelamin?>(null);
  final occupation = ValueNotifier<Pekerjaan?>(null);
  final age = ValueNotifier<String?>(null);

  DateTime? birthDateValue;

  void setBirthDate(DateTime? value) {
    birthDateValue = value;
    birthDate.text = value == null ? '' : HitungUmur.formatTanggal(value);
    age.value = value == null ? null : HitungUmur.formatTahunSejak(value);
  }

  String? validateNik(String? value) {
    if (!requireNik) return null;
    return ValidasiNik.validate(value);
  }

  String? validateName(String? value) {
    if ((value ?? '').trim().isEmpty) return 'Nama wajib diisi';
    return null;
  }

  String? validateBirthPlace(String? value) {
    if ((value ?? '').trim().isEmpty) return 'Tempat lahir wajib diisi';
    return null;
  }

  String? validateBirthDate(String? value) {
    if (!requireBirthDate) return null;
    if ((value ?? '').trim().isEmpty) return 'Tanggal lahir wajib diisi';
    if (birthDateValue == null) return 'Tanggal lahir tidak valid';
    if (birthDateValue!.isAfter(DateTime.now())) {
      return 'Tanggal lahir tidak boleh di masa depan';
    }
    return null;
  }

  String? validateOccupation(Pekerjaan? value) {
    if (value == null) return 'Pekerjaan wajib dipilih';
    return null;
  }

  String? validateAddress(String? value) {
    if ((value ?? '').trim().isEmpty) return 'Alamat wajib diisi';
    return null;
  }

  DataPenduduk keDataPenduduk() => DataPenduduk(
    nik: nik.text.trim().isEmpty ? null : nik.text.trim(),
    name: name.text.trim().isEmpty ? null : name.text.trim(),
    birthPlace: birthPlace.text.trim().isEmpty ? null : birthPlace.text.trim(),
    birthDate: birthDateValue,
    gender: gender.value,
    occupation: occupation.value,
    address: address.text.trim().isEmpty ? null : address.text.trim(),
  );

  void dispose() {
    nik.dispose();
    name.dispose();
    birthPlace.dispose();
    birthDate.dispose();
    address.dispose();
    gender.dispose();
    occupation.dispose();
    age.dispose();
  }
}

class KolomDataOrang extends StatelessWidget {
  const KolomDataOrang({
    super.key,
    required this.state,
    required this.nikHint,
    this.showAddress = true,
    this.showBirthPlace = true,
  });

  final DataOrangForm state;
  final String nikHint;
  final bool showAddress;
  final bool showBirthPlace;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FieldLabel("NIK"),
        KolomTeksSurat(
          label: nikHint,
          controller: state.nik,
          validator: state.validateNik,
          isNumber: true,
          maxLength: ValidasiNik.length,
        ),
        const FieldLabel("Nama Lengkap"),
        KolomTeksSurat(
          label: "Nama Lengkap",
          controller: state.name,
          validator: state.validateName,
        ),
        if (state.withGender) ...[
          const FieldLabel("Jenis Kelamin"),
          KolomDropdownSurat<JenisKelamin>(
            label: "Jenis Kelamin",
            items: JenisKelamin.values,
            value: state.gender,
            validator: (v) => v == null ? 'Jenis kelamin wajib dipilih' : null,
            itemBuilder: (_, item) => Text(
              item.label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ],
        if (showBirthPlace) ...[
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
                      controller: state.birthPlace,
                      validator: state.validateBirthPlace,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldLabel(
                      state.requireBirthDate
                          ? "Tanggal Lahir"
                          : "Tanggal Lahir (opsional)",
                    ),
                    DateField(
                      controller: state.birthDate,
                      validator: state.validateBirthDate,
                      pickDate: () => _pickDate(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
        if (state.requireBirthDate)
          ValueListenableBuilder<String?>(
            valueListenable: state.age,
            builder: (context, value, _) => Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Text(
                  'Umur: ${value ?? '-'} tahun',
                  style: const TextStyle(fontSize: 11, color: Colors.black45),
                ),
              ),
            ),
          ),
        const FieldLabel("Pekerjaan"),
        KolomDropdownSurat<Pekerjaan>(
          label: "Pekerjaan",
          items: Pekerjaan.values,
          value: state.occupation,
          validator: state.validateOccupation,
          itemBuilder: (_, item) => Text(
            item.label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        if (showAddress) ...[
          const FieldLabel("Alamat"),
          AddressTextField(
            hint:
                "Contoh: Dukuh Krajan RT003 RW001, "
                "Desa Gunung Condong, Kecamatan Bruno",
            controller: state.address,
            validator: state.validateAddress,
          ),
        ],
      ],
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: state.birthDateValue ?? now,
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null) {
      state.setBirthDate(picked);
    }
  }
}
