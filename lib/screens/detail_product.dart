import 'package:flutter/material.dart';
import 'package:glowventory/models/item.dart';

class DetailProductPage extends StatelessWidget {
  final Item item;

  const DetailProductPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${item.fields.name}'),
            Text('Amount: ${item.fields.amount}'),
            Text('Price: ${item.fields.price}'),
            Text('Description: ${item.fields.description}'),
            Text('Category: ${item.fields.category}'),
            // Tambahkan lebih banyak atribut sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
