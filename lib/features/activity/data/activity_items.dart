class ActivityItem {
  const ActivityItem({
    required this.title,
    required this.meta,
    this.isReportCode = false,
  });

  final String title;
  final String meta;
  final bool isReportCode;
}

const String _reportTitle = "LGWS67947799";
const String _reportMeta = "Sukoharjo, 6 jam yang lalu";
const String _newsTitle =
    "Timsel Calon Anggota Komisi Informasi Jamin Kerahasiaan Soal Seleksi";
const String _newsMeta = "17 Sept 2026";

const ActivityItem _report = ActivityItem(
  title: _reportTitle,
  meta: _reportMeta,
  isReportCode: true,
);

const ActivityItem _news = ActivityItem(title: _newsTitle, meta: _newsMeta);

const List<ActivityItem> inProgressReports = [_report, _report, _report];
const List<ActivityItem> finishedReports = [_news, _news, _news];
const List<ActivityItem> savedComplaints = [_report, _report, _report];
const List<ActivityItem> savedNews = [_news, _news, _news];
