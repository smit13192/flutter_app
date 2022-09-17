class CatalogItem {
  static List<Catalog> items = [];
}

class Catalog {
  int id;
  String name;
  int salary;
  String photo;

  Catalog(
      {required this.id,
      required this.name,
      required this.salary,
      required this.photo});

  factory Catalog.fromJson(Map<String, dynamic> map) => Catalog(
      id: map["id"], name: map["name"], salary: map["salary"], photo: map["photo"]);

  toJson() => {"id": id, "name": name, "salary": salary, "photo": photo};
}
