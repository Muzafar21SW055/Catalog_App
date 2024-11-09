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
      ),
      body: Container(
        height: 100,
        width: 100,
        color: Colors.cyan,
      ),
      drawer: MyDrawer(),
    );
  }
}
