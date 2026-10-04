enum ProfileMenuAction {
  profileInfo,
  accountSettings,
  helpCenter,
  termsConditions,
  privacyPolicy,
  rateApp,
}

/// Satu item menu profil. Ikonnya dipetakan di presentation karena `IconData`
/// hanya relevan bagi tampilan.
class ProfileMenuItem {
  const ProfileMenuItem({
    required this.label,
    required this.action,
    this.showDivider = true,
  });

  final String label;
  final ProfileMenuAction action;

  /// `false` bila item terakhir pada sebuah bagian sehingga tanpa divider.
  final bool showDivider;
}

/// Satu bagian menu profil.
class ProfileMenuSection {
  const ProfileMenuSection({required this.title, required this.items});

  final String title;
  final List<ProfileMenuItem> items;
}
