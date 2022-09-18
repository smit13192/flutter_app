import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ms_creation/catalog/catalog.dart';

class HomePage extends StatelessWidget {
  final String name;
  final String email;

  const HomePage({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [CatalogHeader(), Expanded(child: ProductScreen())],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20, top: 25),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text(
          "Catalog App",
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 10, 0, 100)),
        ),
        SizedBox(
          height: 5,
        ),
        Text("Treanding App",
            style:
                TextStyle(fontSize: 20, color: Color.fromARGB(255, 10, 0, 100)))
      ]),
    );
  }
}

// ignore: must_be_immutable
class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final jsondecodedata = jsonDecode(catalogJson);
    var productdata = jsondecodedata["products"];
    CatalogItem.items = List.from(productdata)
        .map<Item>((item) => Item.fromJson(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return (CatalogItem.items.isNotEmpty)
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogItem.items.length,
            itemBuilder: (context, index) => CatalogListItem(
                  catalog: CatalogItem.items[index],
                ))
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}

// ignore: must_be_immutable
class CatalogListItem extends StatefulWidget {
  Item catalog;

  CatalogListItem({super.key, required this.catalog});

  @override
  State<CatalogListItem> createState() => _CatalogListItemState();
}

class _CatalogListItemState extends State<CatalogListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(8.0),
      elevation: 2,
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 239, 239, 239)),
          margin: const EdgeInsets.all(10.0),
          height: 100,
          width: 140,
          child: Image.network(widget.catalog.image.toString()),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.catalog.name,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 10, 0, 100)),
                ),
                Text(
                  widget.catalog.desc,
                  style: const TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 17, 0, 169)),
                ),
                ButtonBar(
                  buttonPadding: EdgeInsets.zero,
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.catalog.price}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 17, 0, 169)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: ElevatedButton(
                          onPressed: () {}, child: const Icon(Icons.add_card)),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
