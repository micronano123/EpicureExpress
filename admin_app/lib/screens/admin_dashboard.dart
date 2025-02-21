import 'package:flutter/material.dart';
import 'manage_menu.dart';
import 'manage_vendors.dart';
import 'manage_drivers.dart';
import 'logs_reports.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AdminButton(title: "Manage Menu", screen: ManageMenu()),
            AdminButton(title: "Manage Vendors", screen: ManageVendors()),
            AdminButton(title: "Manage Drivers", screen: ManageDrivers()),
            AdminButton(title: "Logs & Reports", screen: LogsReports()),
          ],
        ),
      ),
    );
  }
}

class AdminButton extends StatelessWidget {
  final String title;
  final Widget screen;

  AdminButton({required this.title, required this.screen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
        },
        child: Text(title),
      ),
    );
  }
}
