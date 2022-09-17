import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ms_creation/catalog/catalog.dart';
import 'package:ms_creation/utilites/drawer.dart';

class HomePage extends StatelessWidget {
  final String name;
  final String email;

  const HomePage({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Catalog App"),
        actions: const [
          Padding(padding: EdgeInsets.only(right: 10), child: Icon(Icons.home)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.settings))
        ],
      ),
      body: const ProductScreen(),
      drawer: MyDrawer(name: name, email: email),
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
    var catalogJson = await rootBundle.loadString("assets/files/item.json");
    final productdata = jsonDecode(catalogJson);
    CatalogItem.items = List.from(productdata)
        .map<Item>((item) => Item.fromJson(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return (CatalogItem.items.isNotEmpty)
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: CatalogItem.items.length,
                itemBuilder: (context, index) => Card(
                      margin: const EdgeInsets.all(8.0),
                      elevation: 3,
                      child: Row(children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: NetworkImage(CatalogItem
                                      .items[index].photo
                                      .toString()))),
                          margin: const EdgeInsets.all(8.0),
                          height: 80,
                          width: 80,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  CatalogItem.items[index].name,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "${CatalogItem.items[index].salary}",
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                    )),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
