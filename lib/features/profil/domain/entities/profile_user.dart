/// Data profil pengguna yang sedang login.
class ProfileUser {
  const ProfileUser({
    required this.displayName,
    required this.email,
    required this.fullName,
    required this.formEmail,
    required this.formPhone,
    required this.maskedEmail,
    required this.maskedPhone,
  });

  /// Nama yang tampil pada kartu profil.
  final String displayName;

  /// Email yang tampil pada kartu profil.
  final String email;

  /// Nilai awal form informasi utama: nama, email, dan nomor Whatsapp.
  final String fullName;
  final String formEmail;
  final String formPhone;

  /// Email tersamar pada detail data diri.
  final String maskedEmail;

  /// Nomor Whatsapp tersamar pada detail data diri.
  final String maskedPhone;
}

/// Satu baris informasi pada detail data diri.
class ProfileDetail {
  const ProfileDetail({required this.title, required this.value});

  final String title;
  final String value;
}
