import 'package:flutter/material.dart';

class ManageVendors extends StatefulWidget {
  @override
  _ManageVendorsState createState() => _ManageVendorsState();
}

class _ManageVendorsState extends State<ManageVendors> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  List<Map<String, String>> vendors = [
    {"name": "Joe's Diner", "location": "Cape Town", "contact": "012 345 6789"},
    {"name": "Pizza Palace", "location": "Johannesburg", "contact": "098 765 4321"},
    {"name": "Sushi Spot", "location": "Durban", "contact": "011 223 3445"},
  ];

  void addVendor() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        vendors.add({
          "name": nameController.text,
          "location": locationController.text,
          "contact": contactController.text
        });
      });
      nameController.clear();
      locationController.clear();
      contactController.clear();
      Navigator.pop(context);
    }
  }

  void showAddVendorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add New Vendor"),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Vendor Name"),
                  validator: (value) => value!.isEmpty ? "Enter vendor name" : null,
                ),
                TextFormField(
                  controller: locationController,
                  decoration: InputDecoration(labelText: "Location"),
                  validator: (value) => value!.isEmpty ? "Enter location" : null,
                ),
                TextFormField(
                  controller: contactController,
                  decoration: InputDecoration(labelText: "Contact"),
                  keyboardType: TextInputType.phone,
                  validator: (value) => value!.isEmpty ? "Enter contact" : null,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
            ElevatedButton(onPressed: addVendor, child: Text("Add")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Manage Vendors")),
      body: ListView.builder(
        itemCount: vendors.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(vendors[index]["name"]!),
              subtitle: Text("${vendors[index]["location"]!} - ${vendors[index]["contact"]!}"),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddVendorDialog,
        child: Icon(Icons.add),
        tooltip: "Add Vendor",
      ),
    );
  }
}
