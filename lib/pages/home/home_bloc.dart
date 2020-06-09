import 'package:bloc/bloc.dart';
import 'package:ecommerce/models/home_state.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/repositories/product_repository.dart';
import 'package:flutter/foundation.dart';

enum HomeEventType {
  filterProducts,
  loadAllProducts,
  loadJackets,
  loadShirts,
  loadShoes,
  loadSweatshirts
}

class HomeEvent {
  HomeEventType type;
  String filter;
  HomeEvent({this.type, this.filter});
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeState(
      products: List<Product>(), selectedCategory: ProductCategory.All);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    switch (event.type) {
      case HomeEventType.loadAllProducts:
        yield HomeState(
            products: ProductRepository().products,
            selectedCategory: ProductCategory.All);
        break;
      case HomeEventType.loadJackets:
        yield HomeState(
            products: ProductRepository()
                .products
                .where((p) => p.category == ProductCategory.Jackets)
                .toList(),
            selectedCategory: ProductCategory.Jackets);
        break;
      case HomeEventType.loadShirts:
        yield HomeState(
            products: ProductRepository()
                .products
                .where((p) => p.category == ProductCategory.Shirts)
                .toList(),
            selectedCategory: ProductCategory.Shirts);
        break;
      case HomeEventType.loadShoes:
        yield HomeState(
            products: ProductRepository()
                .products
                .where((p) => p.category == ProductCategory.Shoes)
                .toList(),
            selectedCategory: ProductCategory.Shoes);
        break;
      case HomeEventType.loadSweatshirts:
        yield HomeState(
            products: ProductRepository()
                .products
                .where((p) => p.category == ProductCategory.Sweatshirts)
                .toList(),
            selectedCategory: ProductCategory.Sweatshirts);
        break;
      case HomeEventType.filterProducts:
        yield HomeState(
            products: ProductRepository()
                .products
                .where((p) =>
                    p.name.toLowerCase().startsWith(event.filter.toLowerCase()))
                .toList(),
            selectedCategory: ProductCategory.All);
        break;
      default:
    }
    yield state;
  }
}
