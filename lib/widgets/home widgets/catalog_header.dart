import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, // Aligns the children at the start
          children: [
            "Catalog App".text.xl5.bold.color(context.colors.secondary).make(),
            80.widthBox,
            IconButton(
              icon: Icon(CupertinoIcons.sidebar_right),
              iconSize: 25.0,
              color: context.colors.secondary,
              onPressed: () {
                Scaffold.of(context)
                    .openDrawer(); // Open the drawer on button press
              },
            ),
          ],
        ),
        "Trending Products".text.xl.color(context.colors.secondary).make(),
      ],
    );
  }
}
