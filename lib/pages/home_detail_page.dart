// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:learningdart/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:learningdart/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  // const HomeDetailPage({
  //   Key? key,
  //   required this.catalog,
  // }) : super(key: key);

  final Item catalog;
  String user = "Muzafar";

  HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false, //top & bottom to remove safeArea blackspace.
      child: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.xl4.bold.color(Colors.red[800]).make(),
              ElevatedButton(
                onPressed: () {
                  print("$user wants to buy ${catalog.name}");
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MyTheme.darkblue),
                ),
                child: "Buy".text.xl.bold.color(MyTheme.creamColor).make(),
              ).wh(120, 40)
            ],
          ).p32(),
        ),
        backgroundColor: const Color.fromARGB(255, 245, 245, 224),
        body: Column(
          children: [
            Hero(
              tag: Key(
                catalog.id.toString(),
              ),
              child: Image.network(catalog.image!).p16(),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 15.0,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name!.text.xl3
                        .color(MyTheme.darkblue)
                        .bold
                        .make()
                        .py8(),
                    6.heightBox,
                    catalog.desc!.text
                        .textStyle(context.captionStyle)
                        .light
                        .make()
                        .px12(),
                  ],
                ).py32(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
