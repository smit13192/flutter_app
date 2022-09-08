import 'package:flutter/material.dart';
import 'package:ms_creation/catalog/catalog.dart';

class HomePage extends StatelessWidget {
  final String name;
  const HomePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    List catalogItem = makeCatalog();

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Home"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
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
    margin: const EdgeInsets.symmetric(vertical: 4.0),
    elevation: 3,
    child: ListTile(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      leading: Image.asset("assets/images/working.png"),
      title: Text(catalog.title),
      subtitle: Text(catalog.subTitle),
      trailing: Text("\$${catalog.salary}"),
    ),
  );
}

List makeCatalog() {
  List list = List.generate(
      20,
      (index) => Catalog(
          id: 1,
          title: "Working Employee",
          subTitle: "Working Smit",
          salary: "1000"));
  return list;
}
