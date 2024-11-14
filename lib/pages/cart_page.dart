import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/core/store.dart';
import 'package:learningdart/models/cart_model.dart';
import 'package:learningdart/models/catalog.dart';
import 'package:learningdart/widgets/home%20widgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: context.canvasColor,
        title: "Cart".text.color(context.colors.secondary).bold.xl3.make(),
      ),
      body: Column(
        children: [
          _CartList().p16().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context, status, _) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl4
                  .color(context.colors.secondary)
                  .make()
                  .px8();
            },
          ),
          30.widthBox,
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all(context.colors.primary),
              backgroundColor:
                  MaterialStateProperty.all(context.colors.secondary),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying Not Supported Yet.".text.make(),
                ),
              );
            },
            child: "Buy".text.color(context.colors.primary).xl2.make(),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Cart is Empty".text.bold.xl2.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                leading: IconButton(
                  color: context.colors.secondary,
                  onPressed: () {},
                  icon: Icon(Icons.check_box_outlined),
                ),
                trailing: IconButton(
                  color: context.colors.secondary,
                  onPressed: () {
                    RemoveMutation(item: _cart.items[index]);
                  },
                  icon: Icon(Icons.remove_circle_outline_outlined),
                ),
                title: Text(
                  _cart.items[index].name!,
                  style: TextStyle(color: context.colors.secondary),
                )),
          );
  }
}
