import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startingPriceController = TextEditingController();
  final TextEditingController biddingEndController = TextEditingController();

  void addProduct() {
    // Add product logic (to be integrated with backend)
    print("Product Added: ${nameController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Admin Panel', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Product Description'),
            ),
            TextField(
              controller: startingPriceController,
              decoration: const InputDecoration(labelText: 'Starting Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: biddingEndController,
              decoration: const InputDecoration(labelText: 'Bidding End Time (yyyy-mm-dd HH:MM)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton( style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue)),
              onPressed: addProduct,
              child: const Text('Add Product', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
