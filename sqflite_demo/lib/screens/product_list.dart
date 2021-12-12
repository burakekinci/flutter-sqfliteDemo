import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/db_helper.dart';
import 'package:sqflite_demo/models/product.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  var dbHelper = DbHelper();
  late List<Product> products;
  int productCount = 0;

  @override
  void initState() {
    var productsFuture = dbHelper.getProducts();
    productsFuture.then((value) => products = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ürün Listesi"),
      ),
      body: buildProductLists(),
    );
  }

  ListView buildProductLists() {
    return ListView.builder(
        itemCount: productCount,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.cyanAccent,
            elevation: 2.0,
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.red,
                child: Text("p"),
              ),
              title: Text(products[position].name),
              subtitle: Text(products[position].description),
              onTap: () {},
            ),
          );
        });
  }
}
