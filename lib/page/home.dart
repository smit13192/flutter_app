import 'package:flutter/material.dart';
import 'package:ms_creation/catalog/catalog.dart';

class HomePage extends StatelessWidget {
  final String name;
  const HomePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    // this is the list to the display the data to the generate to the function 
    List catalogItem = makeListCatalog();

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Home"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
          // this is the listview to the generate list to the catalog
          child: ListView.builder(
            itemBuilder: ((context, index) {
              return makeCardCatalog(catalogItem[index]);
            }),
            itemCount: catalogItem.length,
          ),
        ));
  }
}

// this function to the generate to the catalog display widget
Widget makeCardCatalog(Catalog catalog) {
  // make own card view instead of listTile
  return Card(
      elevation: 2,
      child: Row(
        children: [
          SizedBox(
              height: 80,
              width: 80,
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

// this function to the generate to the list of the catalog items
List makeListCatalog() {
  List list = List.generate(
      20,
      (index) => Catalog(
          id: 1,
          title: "Working Employee",
          subTitle: "Working Smit",
          salary: "1000"));
  return list;
}
