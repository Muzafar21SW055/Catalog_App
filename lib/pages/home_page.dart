import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:learningdart/models/catalog.dart';
import 'package:learningdart/utils/routes.dart';
import 'package:learningdart/widgets/drawer.dart';
import 'package:learningdart/widgets/home%20widgets/catalog_header.dart';
import 'package:learningdart/widgets/home%20widgets/catalog_list.dart';
import 'package:learningdart/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 4;

  final String name = "Codepur";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJSON =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedJSON = jsonDecode(catalogJSON);
    var productData = decodedJSON["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.colors.secondary,
        foregroundColor: context.colors.primary,
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        child: Icon(CupertinoIcons.cart_fill).iconSize(35),
      ).px12().w24(context),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              // ignore: unnecessary_null_comparison
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
    );
  }
}
