import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 4;
  final String name = "Codepur";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          child: Text("Learning Flutter in $days Days with $name ."),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
