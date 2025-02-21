import 'package:flutter/material.dart';

class OrderCart extends StatelessWidget{
  final String pickup;
  final String dropoff;

  OrderCart({required this.pickup, required this.dropoff});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Pickup: $pickup'),
        subtitle: Text('Dropoff: $dropoff'),
      ),
    );
  }
}