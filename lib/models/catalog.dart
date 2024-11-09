class CatalogModel {
  static final items = [
    Item(
      id: 1,
      name: "iPhone 16 Pro Max",
      desc:
          "Apple's top-tier iPhone with powerful performance and improved camera.",
      price: 1299,
      color: "#1C1C1E",
      image:
          "https://qmart.pk/cdn/shop/files/Apple-iPhone-16-Pro-Qmart-2.jpg?v=1726140072",
      description: "",
    )
  ];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final String description;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.description,
      required this.price,
      required this.color,
      required this.image});
}
