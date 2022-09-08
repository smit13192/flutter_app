import 'package:flutter/material.dart';
import 'package:ms_creation/catalog/catalog.dart';

class HomePage extends StatelessWidget {
  final String name;
  const HomePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    List catalogItem = makeListCatalog();

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Home"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: ListView.builder(
            itemBuilder: ((context, index) {
              return makeCardCatalog(catalogItem[index]);
            }),
            itemCount: catalogItem.length,
          ),
        ));
  }
}

Widget makeCardCatalog(Catalog catalog) {
  return Card(
      elevation: 2,
      child: Row(
        children: [
          SizedBox(
              height: 100,
              width: 100,
              child: Image.asset("assets/images/working.png")),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  catalog.title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(221, 68, 68, 68)),
                ),
                Text(
                  catalog.subTitle,
                  style: const TextStyle(
                      fontSize: 15, color: Color.fromARGB(221, 95, 95, 95)),
                )
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(right: 10), child: Icon(Icons.add_card))
        ],
      ));
}

List makeListCatalog() {
  List list = List.generate(
      10,
      (index) => Catalog(
          id: 1,
          title: "Working Employee",
          subTitle: "Working Smit",
          salary: "1000"));
  return list;
}
