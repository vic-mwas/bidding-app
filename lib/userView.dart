import 'package:flutter/material.dart';

import 'BidPage.dart';
import 'Product.dart';

class UserCatalogPage extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Product 1', description: 'Description 1', startingPrice: 100, biddingEndTime: DateTime.now().add(Duration(hours: 1))),
    Product(name: 'Product 2', description: 'Description 2', startingPrice: 200, biddingEndTime: DateTime.now().add(Duration(hours: 2))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:  const Text('Product Catalog',

        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              title: Text(product.name),
              subtitle: Text('${product.description}\nStarting Price: \$${product.startingPrice}'),
              trailing: product.biddingEndTime.isBefore(DateTime.now()) ? const Text('Bidding Closed',) : ElevatedButton( style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue)),
                onPressed: () {
                  // Navigate to Bid Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BidPage(product: product),
                    ),
                  );
                },
                child: Text('Place Bid', style: TextStyle(color: Colors.black),),

              ),
            ),
          );
        },
      ),
    );
  }
}