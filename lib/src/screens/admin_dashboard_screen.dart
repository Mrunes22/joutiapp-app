
import 'package:flutter/material.dart';
import '../services/report_service.dart';
import '../models/report.dart';

class AdminDashboardScreen extends StatefulWidget {
  static const routeName = '/admin';
  const AdminDashboardScreen({Key? key}) : super(key: key);

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  late Future<List<Report>> _reports;

  @override
  void initState() {
    super.initState();
    _reports = ReportService().fetchReports(onlyUnseen: true);
  }

  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: const Text('Tableau de bord Admin')),
    body: FutureBuilder<List<Report>>(
      future: _reports,
      builder: (ctx, snap) {
        if (!snap.hasData) return const Center(child: CircularProgressIndicator());
        final list = snap.data!;
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, i) {
            final r = list[i];
            return ListTile(
              title: Text('${r.type} signalé: ${r.reason}'),
              subtitle: Text('Par: ${r.reportedBy.split("/").last}'),
              trailing: IconButton(
                icon: const Icon(Icons.check),
                onPressed: () async {
                  await ReportService().markSeen(r.id);
                  setState(() => _reports = ReportService().fetchReports(onlyUnseen: true));
                },
              ),
            );
          },
        );
      },
    ),
  );
}
