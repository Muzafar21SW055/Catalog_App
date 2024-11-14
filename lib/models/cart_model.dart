// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:learningdart/core/store.dart';
import 'package:learningdart/models/catalog.dart';

class CartModel {
  //catalog field
  late CatalogModel _catalog;

  //Collection of Item IDs, Storing ID of each item.
  final List<int> _itemIds = [];

  //var _items;

  //get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total amount from the cart

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price!);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  // Constructor should only take 'Item item'
  AddMutation(Item catalog, {required this.item});

  @override
  perform() {
    store!.cart._itemIds.add(item.id!.toInt());
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  // Constructor should only take 'Item item'
  RemoveMutation({required this.item});

  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
