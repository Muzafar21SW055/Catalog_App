import 'package:flutter/material.dart';
import 'package:learningdart/models/catalog.dart';

class CartModel {
  //catalog field
  late CatalogModel _catalog;

  //Collection of Item IDs, Storing ID of each item.
  final List<int> _itemIds = [];

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

  //add item

  void add(Item item) {
    _itemIds.add(item.id!.toInt());
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
