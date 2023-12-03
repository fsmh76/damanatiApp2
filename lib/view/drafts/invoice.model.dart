class Item {
  final String itemName;
  final String itemPicture;
  final DateTime startDate;
  final DateTime endDate;
  final String contactNumber;
  final String description;
  final String invoicePicture;
  final String shopPicture;

  Item({
    required this.itemName,
    required this.itemPicture,
    required this.startDate,
    required this.endDate,
    required this.contactNumber,
    required this.description,
    required this.invoicePicture,
    required this.shopPicture,
  });
}

List<Item> items = [
  Item(
    itemName: "phone",
    itemPicture: "assets/images/1.jpg",
    startDate: DateTime(2012, 2, 21),
    endDate: DateTime(2026, 3, 10),
    contactNumber: "1-800-989-1214",
    description: "This is a TV.",
    invoicePicture: "assets/images/3.jpg",
    shopPicture: "assets/images/shop.jpg",
  ),
  Item(
    itemName: "phone",
    itemPicture: "assets/images/1.jpg",
    startDate: DateTime(2012, 2, 21),
    endDate: DateTime(2026, 3, 10),
    contactNumber: "1-800-989-1214",
    description: "This is a TV.",
    invoicePicture: "assets/images/3.jpg",
    shopPicture: "assets/images/3.jpg",
  ),
  Item(
    itemName: "phone",
    itemPicture: "assets/images/1.jpg",
    startDate: DateTime(2012, 2, 21),
    endDate: DateTime(2026, 3, 10),
    contactNumber: "1-800-989-1214",
    description: "This is a TV.",
    invoicePicture: "assets/images/3.jpg",
    shopPicture: "assets/images/3.jpg",
  ),
  Item(
    itemName: "phone",
    itemPicture: "assets/images/1.jpg",
    startDate: DateTime(2012, 2, 21),
    endDate: DateTime(2026, 3, 10),
    contactNumber: "1-800-989-1214",
    description: "This is a TV.",
    invoicePicture: "assets/images/3.jpg",
    shopPicture: "assets/images/3.jpg",
  ),
  Item(
    itemName: "phone",
    itemPicture: "assets/images/1.jpg",
    startDate: DateTime(2012, 2, 21),
    endDate: DateTime(2026, 3, 10),
    contactNumber: "1-800-989-1214",
    description: "This is a TV.",
    invoicePicture: "assets/images/3.jpg",
    shopPicture: "assets/images/3.jpg",
  ),
];
