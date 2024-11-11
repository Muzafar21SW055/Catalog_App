import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/models/catalog.dart';
import 'package:learningdart/pages/home_detail_page.dart';
import 'package:learningdart/widgets/home%20widgets/catalog_image.dart';
import 'package:learningdart/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeDetailPage(
                        catalog: catalog,
                      ),
                    ),
                  ),
              child: CatalogItem(catalog: catalog));
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : //assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(
            catalog.id.toString(),
          ),
          child: CatalogImage(image: catalog.image!),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name!.text.light.color(MyTheme.darkblue).bold.make(),
              catalog.desc!.text.xs.textStyle(context.captionStyle).make(),
              7.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.xl.bold.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkblue),
                      foregroundColor:
                          MaterialStateProperty.all(MyTheme.creamColor),
                    ),
                    child: Icon(CupertinoIcons.cart_fill_badge_plus)
                        .iconSize(25.0),
                  )
                ],
              ).pOnly(top: 10.0, right: 15.0)
            ],
          ),
        )
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}
