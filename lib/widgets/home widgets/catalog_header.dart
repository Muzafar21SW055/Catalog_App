import 'package:flutter/material.dart';
import 'package:learningdart/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkblue).make(),
        "Trendig Products".text.xl.color(MyTheme.darkblue).make()
      ],
    );
  }
}