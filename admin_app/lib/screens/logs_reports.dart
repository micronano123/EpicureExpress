import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LogsReports extends StatefulWidget {
  @override
  _LogsReportsState createState() => _LogsReportsState();
}

class _LogsReportsState extends State<LogsReports> {
  List<Map<String, String>> logs = [
    {"message": "Vendor 'Joe's Diner' added", "timestamp": getFormattedTime()},
    {"message": "Driver 'John Doe' registered", "timestamp": getFormattedTime()},
    {"message": "Menu item 'Burger' updated", "timestamp": getFormattedTime()},
    {"message": "Order #1234 marked as delivered", "timestamp": getFormattedTime()},
    {"message": "Vendor 'Pizza Palace' removed", "timestamp": getFormattedTime()},
  ];

  static String getFormattedTime() {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Logs & Reports')),
      body: ListView.builder(
        itemCount: logs.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.history, color: Colors.blue),
            title: Text(logs[index]["message"]!),
            subtitle: Text("Timestamp: ${logs[index]["timestamp"]!}"),
          );
        },
      ),
    );
  }
}
