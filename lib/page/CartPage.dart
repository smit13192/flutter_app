import 'package:flutter/material.dart';
import 'package:ms_creation/catalog/catalog.dart';
import 'package:ms_creation/page/home.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      body: SafeArea(
        child: CatalogItem.additem.isNotEmpty
            ? ListView.builder(
                itemCount: CatalogItem.additem.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    margin: const EdgeInsets.all(8.0),
                    elevation: 1,
                    child: Row(children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 239, 239, 239)),
                        margin: const EdgeInsets.all(10.0),
                        height: 100,
                        width: 140,
                        child: Image.network(
                            CatalogItem.additem[index].image.toString()),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                CatalogItem.additem[index].name,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 10, 0, 100)),
                              ),
                              Text(
                                CatalogItem.additem[index].desc,
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
                                    "\$${CatalogItem.additem[index].price}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 17, 0, 169)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          CatalogItem.additem.removeAt(index);
                                          setState(() {});
                                        },
                                        child: const Icon(Icons.remove_circle)),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ]),
                  );
                })
            : const Center(
                child: Text(
                "Bucket Is Empty",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 10, 0, 100)),
              )),
      ),
    );
  }
}
