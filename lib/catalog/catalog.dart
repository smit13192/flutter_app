class CatalogItem {
  static List<Item> items = [];
}

class Item {
  int id;
  String name;
  int salary;
  String photo;

  Item(
      {required this.id,
      required this.name,
      required this.salary,
      required this.photo});

  factory Item.fromJson(Map<String, dynamic> map) => Item(
      id: map["id"], name: map["name"], salary: map["salary"], photo: map["photo"]);

  toJson() => {"id": id, "name": name, "salary": salary, "photo": photo};
}
