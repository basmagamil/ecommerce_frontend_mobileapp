import 'package:ecommerce/components/option_card.dart';
import 'package:ecommerce/components/product_card.dart';
import 'package:ecommerce/models/details_state.dart';
import 'package:ecommerce/models/home_state.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/pages/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'details_bloc.dart';

class DetailsView extends StatelessWidget {
  final Product product;
  DetailsView({this.product});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsBloc>(
      create: (BuildContext context) => DetailsBloc()
        ..add(DetailsEvent(type: DetailsEventType.incrementQuantity)),
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.favorite_border),
                  )
                ],
                elevation: 0,
                expandedHeight: 400.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return new Image.network(
                        this.product.images[index],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: this.product.images.length,
                    loop: false,
                    pagination: new SwiperPagination(),
                  ),
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(this.product.images[0]),
                ),
                trailing: Text(
                  "${this.product.price} جم",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                title: Text(this.product.brand,
                    style: TextStyle(fontWeight: FontWeight.w700)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19),
                    child: Text(
                      this.product.name,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19),
                    child: Text(
                      this.product.description,
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Colors.grey[500],
                          height: 1.3),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  "المزيد من التفاصيل",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                initiallyExpanded: true,
                children: <Widget>[
                  ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      indent: 19,
                      endIndent: 19,
                      color: Colors.grey,
                    ),
                    shrinkWrap: true,
                    itemCount: this.product.details.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 19),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              this.product.details[i].name,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  children: List.generate(
                                      this.product.details[i].choices.length,
                                      (j) {
                                    return OptionCard(
                                        option:
                                            this.product.details[i].choices[j],
                                        optionClicked: (String option) {
                                          context.bloc<DetailsBloc>().add(
                                              DetailsEvent(
                                                  type: DetailsEventType
                                                      .selectOption,
                                                  option: this
                                                      .product
                                                      .details[i]
                                                      .choices[j]));
                                        });
                                  }),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  Divider(
                    // height: 30,
                    thickness: 0.4,
                    indent: 19,
                    endIndent: 19,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "الكمية",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 19, vertical: 15),
                    child: BlocBuilder<DetailsBloc, DetailsState>(
                        builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: InkWell(
                                  onTap: () {
                                    context.bloc<DetailsBloc>().add(
                                        DetailsEvent(
                                            type: DetailsEventType
                                                .incrementQuantity));
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Colors.grey[400])),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.grey[400],
                                      )),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(state.quantity.toString()),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: InkWell(
                                  onTap: () {
                                    context.bloc<DetailsBloc>().add(
                                        DetailsEvent(
                                            type: DetailsEventType
                                                .decrementQuantity));
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey[400])),
                                      child: Icon(Icons.remove,
                                          color: Colors.grey[400])),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "${this.product.price * state.quantity} جم",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )
                        ],
                      );
                    }),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        color: Colors.black,
                        child: Text(
                          "أضف إلى العربة الآن",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.4,
                indent: 19,
                endIndent: 19,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 19),
                    child: Text(
                      "قد يعجبك أيضاً",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
              BlocProvider<HomeBloc>(
                create: (context) => HomeBloc()
                  ..add(HomeEvent(type: HomeEventType.loadAllProducts)),
                child: Expanded(child:
                    BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 19.0),
                    child: ListView(
                        scrollDirection: Axis.horizontal,
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
                })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
