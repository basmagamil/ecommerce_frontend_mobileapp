class Product {
  int id;
  String name;
  int price;
  ProductCategory category;
  String description;
  List<String> images;
  List<Option> details;
  String brand;
  Product(
      {this.id,
      this.name,
      this.price,
      this.category,
      this.description,
      this.images,
      this.brand,
      this.details});
}

enum ProductCategory { All, Jackets, Shirts, Shoes, Sweatshirts }
// enum Size { S, M, L, X, XL }

class Option {
  String name;
  List<String> choices;
  Option({this.name, this.choices});
}
