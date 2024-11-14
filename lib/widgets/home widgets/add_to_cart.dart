import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/models/cart_model.dart';
import 'package:learningdart/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if(!isInCart){
        isInCart = isInCart.toggle();
        final _catalog = CatalogModel();

        _cart.catalog = _catalog;
        _cart.add(widget.catalog);

        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: "Added to Cart".text.make(),
          ),
        );}
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.colors.secondary),
        foregroundColor: MaterialStateProperty.all(context.colors.primary),
      ),
      child: isInCart
          ? Icon(CupertinoIcons.cart_fill)
          : Icon(CupertinoIcons.cart_badge_plus).iconSize(25.0),
    );
  }
}
