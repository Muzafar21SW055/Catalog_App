import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .height(123)
        .width(123)
        .p8
        .roundedLg
        .color(context.canvasColor)
        .make()
        .p8()
        .w32(context);
  }
}
