import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learningdart/core/store.dart';
import 'package:learningdart/models/cart_model.dart';
import 'dart:convert';
import 'package:learningdart/models/catalog.dart';
import 'package:learningdart/utils/routes.dart';
import 'package:learningdart/widgets/drawer.dart';
import 'package:learningdart/widgets/home%20widgets/catalog_header.dart';
import 'package:learningdart/widgets/home%20widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 4;

  final String name = "Codepur";

  final url = "https://api.jsonbin.io/v3/b/67368333acd3cb34a8a8c321";

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
    //final response = await http.get(Uri.parse(url));

    //final catalogJSON = response.body;

    final decodedJSON = jsonDecode(catalogJSON);
    var productData = decodedJSON["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, status, _) => FloatingActionButton(
          backgroundColor: context.colors.secondary,
          foregroundColor: context.colors.primary,
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: Icon(CupertinoIcons.cart_fill).iconSize(35),
        ).badge(
            textStyle: TextStyle(
                fontWeight: FontWeight.bold, color: context.colors.secondary),
            color: context.colors.primary,
            size: 20.0,
            count: _cart.items.length),
      ),
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
                LinearProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
