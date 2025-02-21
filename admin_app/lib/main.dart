import 'package:flutter/material.dart';
import 'screens/admin_dashboard.dart';
import 'screens/manage_menu.dart';
import 'screens/manage_vendors.dart';
import 'screens/logs_reports.dart';

void main() {
  runApp(AdminApp());
}

class AdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AdminDashboard(),
    );
  }
}
