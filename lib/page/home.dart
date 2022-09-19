import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ms_creation/catalog/catalog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        // safe area means to navigastion bar area is no contain in the body
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 45, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // catalog home page header
              CatalogHeader(),
              // this is the list of the catalog items
              Expanded(child: ProductScreen())
            ],
          ),
        ),
      ),

      // push to the cart page
      floatingActionButton: FloatingActionButton(
        tooltip: "${CatalogItem.additem.length}",
        elevation: 5,
        onPressed: () {
          Navigator.pushNamed(context, "/Cart");
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

// this is the header of the catalog page
class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20, top: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Catalog App", style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(
          height: 5,
        ),
        Text("Treanding App", style: Theme.of(context).textTheme.headlineSmall)
      ]),
    );
  }
}

// ignore: must_be_immutable
// this is the product screen and this is the statefullwidget
class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // when this class is restart when initState is run
  @override
  void initState() {
    super.initState();
    loadData();
  }

  CatalogItem product = CatalogItem();

  // this is the load data to the json file function
  loadData() async {
    await Future.delayed(const Duration(seconds: 2)); //delay 2 second

    // get string to the json
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");

    // decode string to give in the json
    final jsondecodedata = jsonDecode(catalogJson);

    // json file ni andar no product name ni list use karva mate
    var productdata = jsondecodedata["products"];

    // make the list of the Item
    product.items = List.from(productdata)
        .map<Item>((item) => Item.fromJson(item))
        .toList();

    // setState to change the data
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // list view to display catalog item
    return (product.items.isNotEmpty)
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: product.items.length,
            itemBuilder: (context, index) => CatalogListItem(
                  catalog: product.items[index],
                ))
        : const Center(
            child: CircularProgressIndicator(),
          );
    // if catalog item is empty when display circularproggressindicator
  }
}

// this is the catalogListIteam widget
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
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(8.0),
      elevation: 1,
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).scaffoldBackgroundColor),
          margin: const EdgeInsets.all(15.0),
          width: 140,
          child: Image.network(widget.catalog.image.toString()),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
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
                      overflow: TextOverflow.clip,
                      fontSize: 15,
                      color: Color.fromARGB(255, 17, 0, 169)),
                ),
                ButtonBar(
                  buttonPadding: EdgeInsets.zero,
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.catalog.price}",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 17, 0, 169)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: ElevatedButton(
                          onPressed: () {
                            if (!CatalogItem.additem.contains(widget.catalog)) {
                              CatalogItem.additem.add(widget.catalog);
                            }
                          },
                          child: const Icon(Icons.add_card)),
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
