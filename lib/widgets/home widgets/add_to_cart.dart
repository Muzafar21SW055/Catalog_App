import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/core/store.dart';
import 'package:learningdart/models/cart_model.dart';
import 'package:learningdart/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);

    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          // Trigger the mutation
          AddMutation(catalog, item: catalog);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: "Added to Cart".text.make(),
            ),
          );
        }
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
