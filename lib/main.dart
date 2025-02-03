import 'dart:ui';

import 'package:bidding_app/userView.dart';
import 'package:flutter/material.dart';

import 'adminPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bidding System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,

    );
  }
}

// Main Page with role-based navigation
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulating role-based navigation
    bool isAdmin = true; // Set this based on actual role check, e.g., login state

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bidding System',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/bid_background.png'), // Your background image
            fit: BoxFit.fitHeight,

          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Admin/User navigation button
              ElevatedButton( style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>( Colors.blue),),
                onPressed: () {
                  if (isAdmin) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminPage()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserCatalogPage()),
                    );
                  }
                },
                child: Text(isAdmin ? "Go to Admin Panel" : 'Go to User Catalog', style: const TextStyle(
                  color: Colors.black,
                ),),
              ),
              SizedBox(height: 20), // Spacing between buttons
              // User Button
              ElevatedButton(
                 style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserCatalogPage()),
                  );
                },
                child: Text('Go to User View', style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
