import 'package:ecommerce/components/category_card.dart';
import 'package:ecommerce/components/product_card.dart';
import 'package:ecommerce/models/home_state.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/pages/details/details_view.dart';
import 'package:ecommerce/pages/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.list),
        title: Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Icon(MdiIcons.diamondOutline),
            // child: Icon(Icons.shop),
          ),
          Text("فانسي")
        ]),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.search),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            title: Text('المتجر'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('العربة'),
          ),
        ],
        unselectedItemColor: Colors.grey[500],
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 19),
                child: Text(
                  "اختر الفئة",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 19.0),
              child: ListView(
                  scrollDirection: Axis.horizontal, children: getCategories()),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 19),
                child: Text(
                  "المضاف مؤخراً",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
          Expanded(
              flex: 5,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 17),
                    child: GridView.count(
                        // shrinkWrap: true,
                        // childAspectRatio: 1.0,
                        crossAxisCount: 2,
                        childAspectRatio:
                            MediaQuery.of(context).size.height / 1100,
                        children: List.generate(
                          state.products.length,
                          (i) {
                            return ProductCard(
                              product: state.products[i],
                              productClicked: (Product product) async {
                                await Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailsView(product: product)));
                              },
                            );
                          },
                        )),
                  );
                },
              ))
        ],
      ),
    );
  }

  // _productClicked(Product product) async {
  //   await Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => Text('Hello from product details')));
  // }

  List<Widget> getCategories() {
    List<Widget> lst = new List<Widget>();
    ProductCategory.values.forEach((c) {
      lst.add(BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        return CategoryCard(
          category: c,
          categoryClicked: (c) {
            switch (c) {
              case ProductCategory.All:
                context
                    .bloc<HomeBloc>()
                    .add(HomeEvent(type: HomeEventType.loadAllProducts));
                break;
              case ProductCategory.Jackets:
                context
                    .bloc<HomeBloc>()
                    .add(HomeEvent(type: HomeEventType.loadJackets));
                break;
              case ProductCategory.Shoes:
                context
                    .bloc<HomeBloc>()
                    .add(HomeEvent(type: HomeEventType.loadShoes));
                break;
              case ProductCategory.Shirts:
                context
                    .bloc<HomeBloc>()
                    .add(HomeEvent(type: HomeEventType.loadShirts));
                break;
              case ProductCategory.Sweatshirts:
                context
                    .bloc<HomeBloc>()
                    .add(HomeEvent(type: HomeEventType.loadSweatshirts));
                break;
              default:
            }
          },
        );
      }));
    });
    return lst;
  }
}
