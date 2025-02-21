import 'package:flutter/material.dart';

class ManageDrivers extends StatefulWidget {
  @override
  _ManageDriversState createState() => _ManageDriversState();
}

class _ManageDriversState extends State<ManageDrivers> {
  final TextEditingController driverNameController = TextEditingController();
  final TextEditingController driverPhoneController = TextEditingController();

  List<Map<String, String>> drivers = [
    {"name": "John Doe", "phone": "0712345678"},
    {"name": "Jane Smith", "phone": "0823456789"},
    {"name": "Alex Brown", "phone": "0734567890"},
    {"name": "Emma Wilson", "phone": "0845678901"},
    {"name": "Chris Johnson", "phone": "0767890123"},
  ];

  void addDriver() {
    setState(() {
      drivers.add({
        "name": driverNameController.text,
        "phone": driverPhoneController.text,
      });
      driverNameController.clear();
      driverPhoneController.clear();
    });
  }

  void deleteDriver(int index) {
    setState(() {
      drivers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Drivers')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: driverNameController, decoration: InputDecoration(labelText: 'Driver Name')),
            TextField(controller: driverPhoneController, decoration: InputDecoration(labelText: 'Phone Number')),
            SizedBox(height: 10),
            ElevatedButton(onPressed: addDriver, child: Text("Add Driver")),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: drivers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(drivers[index]["name"]!),
                    subtitle: Text("Phone: ${drivers[index]["phone"]}"),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteDriver(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
