import 'package:flutter/material.dart';

class ManageMenu extends StatefulWidget {
  @override
  _ManageMenuState createState() => _ManageMenuState();
}

class _ManageMenuState extends State<ManageMenu> {
  List<Map<String, String>> menuItems = [
    {
      "name": "Burger",
      "price": "R50",
      "image": "https://source.unsplash.com/100x100/?burger"
    },
    {
      "name": "Pizza",
      "price": "R120",
      "image": "https://source.unsplash.com/100x100/?pizza"
    },
    {
      "name": "Pasta",
      "price": "R85",
      "image": "https://source.unsplash.com/100x100/?pasta"
    },
    {
      "name": "Sushi",
      "price": "R150",
      "image": "https://source.unsplash.com/100x100/?sushi"
    },
    {
      "name": "Salad",
      "price": "R40",
      "image": "https://source.unsplash.com/100x100/?salad"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Manage Menu")),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.network(
                menuItems[index]["image"]!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.image_not_supported),
              ),
              title: Text(menuItems[index]["name"]!),
              subtitle: Text("Price: ${menuItems[index]["price"]!}"),
            ),
          );
        },
      ),
    );
  }
}
