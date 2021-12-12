class Product {
  int? id;
  late String name;
  late String description;
  late double unitPrice;

  Product(
      {required this.name, required this.description, required this.unitPrice});

  Product.withId(
      {required this.id,
      required this.name,
      required this.description,
      required this.unitPrice});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["description"] = description;
    map["unitPrice"] = unitPrice;
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Product.fromObject(dynamic o) {
    id = int.tryParse(o["id"]);
    name = o["name"];
    description = o["description"];
    unitPrice = double.tryParse(o["unitPrice"])!;
  }
}
