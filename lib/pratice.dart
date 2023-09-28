void main() {
  List<Data> l1 = [
    Data(name: "nikunj"),
    Data(name: "hello"),
    Data(name: "apple"),
  ];
  for (int i = 0; i < l1.length; i++) {
    print(l1[i].name);
  }
  print("");
  l1.sort(
    (a, b) => a.name!.compareTo(b.name!),
  );
  for (int i = 0; i < l1.length; i++) {
    print(l1[i].name);
  }
}

class Data {
  String? name;

  Data({
    this.name,
  });
}
