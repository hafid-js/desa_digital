/// Satu item menu di home.
///
/// Menu hanya menyimpan nama route, bukan builder widget, supaya home tidak
/// perlu mengimpor screen milik feature lain.
class HomeMenuItem {
  const HomeMenuItem({
    required this.title,
    required this.icon,
    required this.route,
  });

  final String title;
  final String icon;
  final String route;
}
