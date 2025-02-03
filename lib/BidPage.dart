import 'package:flutter/material.dart';

import 'Product.dart';

class BidPage extends StatefulWidget {
  final Product product;
  BidPage({required this.product});

  @override
  _BidPageState createState() => _BidPageState();
}

class _BidPageState extends State<BidPage> {
  final TextEditingController bidController = TextEditingController();
  double currentBid = 0;

  void placeBid() {
    double bid = double.tryParse(bidController.text) ?? 0;
    if (bid > widget.product.startingPrice && bid > currentBid) {
      setState(() {
        currentBid = bid;
      });
    } else {
      // Handle invalid bid
      print('Bid must be higher than current bid.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bid on ${widget.product.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Current Bid: \$${currentBid.toStringAsFixed(2)}'),
            TextField(
              controller: bidController,
              decoration: InputDecoration(labelText: 'Enter your bid'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue)),
              onPressed: placeBid,
              child: Text('Place Bid', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),

            ),
          ],
        ),
      ),
    );
  }
}