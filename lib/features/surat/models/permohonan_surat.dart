import 'package:desa_digital/features/surat/models/jenis_surat.dart';
import 'package:desa_digital/features/surat/models/warga_negara.dart';
import 'package:desa_digital/features/surat/models/sebab_kematian.dart';
import 'package:desa_digital/features/surat/models/yang_menerangkan.dart';
import 'package:desa_digital/features/surat/models/pendidikan.dart';
import 'package:desa_digital/features/surat/models/hubungan_keluarga.dart';
import 'package:desa_digital/features/surat/models/status_perkawinan.dart';
import 'package:desa_digital/features/surat/models/pekerjaan.dart';
import 'package:desa_digital/features/surat/models/data_penduduk.dart';
import 'package:desa_digital/features/surat/models/agama.dart';

class PermohonanDomisili {
  const PermohonanDomisili({
    required this.citizen,
    required this.religion,
    required this.maritalStatus,
    required this.education,
    required this.occupation,
    required this.citizenship,
    required this.familyCardNumber,
    required this.familyHeadName,
    required this.purpose,
  });

  final DataPenduduk citizen;
  final Agama religion;
  final StatusPerkawinan maritalStatus;
  final Pendidikan education;
  final Pekerjaan occupation;
  final WargaNegara citizenship;
  final String familyCardNumber;
  final String familyHeadName;
  final String purpose;

  JenisSurat get type => JenisSurat.domicile;

  Map<String, dynamic> toMap() => {
    'kode_surat': type.code,
    ...citizen.toMap(),
    'agama': religion.label,
    'agama_id': religion.name,
    'status_perkawinan': maritalStatus.label,
    'status_perkawinan_id': maritalStatus.code,
    'pendidikan': education.label,
    'pendidikan_id': education.code,
    'pekerjaan': occupation.label,
    'warga_negara': citizenship.label,
    'no_kk': familyCardNumber,
    'kepala_kk': familyHeadName,
    'keperluan': purpose,
  };
}

class PermohonanKematian {
  const PermohonanKematian({
    required this.deceased,
    required this.deathDate,
    required this.deathTime,
    required this.deathPlace,
    required this.cause,
    required this.informer,
    required this.reporter,
    required this.reporterRelationship,
    required this.witnesses,
  });

  final DataPenduduk deceased;
  final DateTime deathDate;
  final String deathTime;
  final String deathPlace;
  final SebabKematian cause;
  final YangMenerangkan informer;
  final DataPenduduk reporter;
  final HubunganKeluarga reporterRelationship;
  final List<DataPenduduk> witnesses;

  JenisSurat get type => JenisSurat.death;

  Map<String, dynamic> toMap() => {
    'kode_surat': type.code,
    'lampiran': type.lampiran,
    'nama_kematian': deceased.name,
    'nik_kematian': deceased.nik,
    'sex_id': deceased.gender?.code,
    'tempat_lahir_kematian': deceased.birthPlace,
    'tanggal_lahir_kematian': deceased.birthDate?.toIso8601String(),
    'tanggal_kematian': deathDate.toIso8601String(),
    'jam_kematian': deathTime,
    'tempat_kematian': deathPlace,
    'sebab_kematian': cause.label,
    'sebab_kematian_id': cause.code,
    'yang_menerangkan': informer.label,
    'yang_menerangkan_id': informer.code,
    'nik_pelapor': reporter.nik,
    'nama_pelapor': reporter.name,
    'pekerjaan_pelapor': reporter.occupation?.label,
    'alamat_pelapor': reporter.address,
    'hubungan_pelapor': reporterRelationship.label,
    'hubungan_pelapor_id': reporterRelationship.code,
    'saksi_i': witnesses.isNotEmpty ? witnesses[0].toMap() : null,
    'saksi_ii': witnesses.length > 1 ? witnesses[1].toMap() : null,
  };
}

class PermohonanKelahiran {
  const PermohonanKelahiran({
    required this.baby,
    required this.birthDay,
    required this.birthTime,
    required this.childOrder,
    required this.mother,
    required this.father,
    required this.reporter,
    required this.reporterRelationship,
    required this.witnesses,
  });

  final DataPenduduk baby;
  final String birthDay;
  final String birthTime;
  final int childOrder;
  final DataPenduduk mother;
  final DataPenduduk father;
  final DataPenduduk reporter;
  final HubunganKeluarga reporterRelationship;
  final List<DataPenduduk> witnesses;

  JenisSurat get type => JenisSurat.birth;

  Map<String, dynamic> toMap() => {
    'kode_surat': type.code,
    'lampiran': type.lampiran,
    'nama_anak': baby.name,
    'jenis_kelamin_anak': baby.gender?.label,
    'sex_id': baby.gender?.code,
    'tempat_lahir_anak': baby.birthPlace,
    'tanggal_lahir_anak': baby.birthDate?.toIso8601String(),
    'hari_lahir': birthDay,
    'pukul_lahir': birthTime,
    'anak_ke': childOrder,
    'nik_ibu': mother.nik,
    'nama_ibu': mother.name,
    'tempat_lahir_ibu': mother.birthPlace,
    'tanggal_lahir_ibu': mother.birthDate?.toIso8601String(),
    'umur_ibu': mother.labelUmur,
    'pekerjaan_ibu': mother.occupation?.label,
    'pekerjaanid_ibu': mother.occupation?.code,
    'alamat_ibu': mother.address,
    'nik_ayah': father.nik,
    'nama_ayah': father.name,
    'tempat_lahir_ayah': father.birthPlace,
    'tanggal_lahir_ayah': father.birthDate?.toIso8601String(),
    'umur_ayah': father.labelUmur,
    'pekerjaan_ayah': father.occupation?.label,
    'pekerjaanid_ayah': father.occupation?.code,
    'alamat_ayah': father.address,
    'nik_pelapor': reporter.nik,
    'nama_pelapor': reporter.name,
    'umur_pelapor': reporter.labelUmur,
    'pekerjaan_pelapor': reporter.occupation?.label,
    'alamat_pelapor': reporter.address,
    'hubungan_pelapor': reporterRelationship.label,
    'hubungan_pelapor_id': reporterRelationship.code,
    'saksi_i': witnesses.isNotEmpty ? witnesses[0].toMap() : null,
    'saksi_ii': witnesses.length > 1 ? witnesses[1].toMap() : null,
  };
}
