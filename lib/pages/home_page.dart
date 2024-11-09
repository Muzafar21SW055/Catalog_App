import 'package:flutter/material.dart';
import 'package:learningdart/models/catalog.dart';
import 'package:learningdart/widgets/drawer.dart';
import 'package:learningdart/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 4;
  final String name = "Codepur";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
