import 'package:flutter/material.dart';
import 'package:learningdart/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 4;
  final String name = "Codepur";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
        backgroundColor: Colors.cyan[600],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          child: Text("Learning Flutter in $days Days with $name ."),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
