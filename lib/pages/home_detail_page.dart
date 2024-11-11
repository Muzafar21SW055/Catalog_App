// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:learningdart/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  String user = "Muzafar";

  HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false, //top & bottom to remove safeArea blackspace.
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: Container(
          color: context.cardColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.xl4.bold.color(Colors.red[800]).make(),
              ElevatedButton(
                onPressed: () {
                  print("$user added ${catalog.name} to cart");
                },
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(context.colors.primary),
                  backgroundColor:
                      MaterialStateProperty.all(context.colors.secondary),
                ),
                child: Icon(CupertinoIcons.cart_fill_badge_plus).iconSize(30.0),
              ).wh(80, 50)
            ],
          ).p32(),
        ),
        backgroundColor: context.canvasColor,
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
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name!.text.xl3
                        .color(context.colors.secondary)
                        .bold
                        .make()
                        .py8(),
                    6.heightBox,
                    catalog.desc!.text
                        .color(context.colors.secondary)
                        .textStyle(context.captionStyle)
                        .light
                        .make()
                        .px12(),
                    10.heightBox,
                    "Amet ea ea est et ipsum et sed. Sadipscing invidunt rebum eos sanctus sea, sed diam vero voluptua ut dolores. Dolor erat gubergren voluptua sanctus kasd dolores diam aliquyam. Diam stet consetetur et magna magna, aliquyam ut consetetur justo magna diam tempor sit, ut amet magna magna sed voluptua accusam labore ea sadipscing, labore erat gubergren ipsum rebum sed voluptua diam vero eos, diam sed dolores invidunt invidunt et ea, magna duo ipsum et et eirmod ipsum takimata sed. Dolor."
                        .text
                        .color(context.colors.secondary)
                        .textStyle(context.captionStyle)
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
