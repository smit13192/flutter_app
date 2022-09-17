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
        title: const Text("Home"),
      ),
      body: const ChatScreen(),
      drawer: MyDrawer(name: name, email: email),
    );
  }
}

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
        .map<Catalog>((item) => Catalog.fromJson(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: CatalogItem.items.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 2,
              child: Row(children: [
                Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 80,
                    width: 80,
                    child: Image.network(
                        CatalogItem.items[index].photo.toString())),
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
            );
          }),
    );
  }
}
