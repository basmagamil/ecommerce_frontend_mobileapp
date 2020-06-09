import 'package:ecommerce/models/product.dart';

class HomeState {
  List<Product> products;
  ProductCategory selectedCategory;
  HomeState({this.products, this.selectedCategory});
}
