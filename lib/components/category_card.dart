import 'package:ecommerce/models/home_state.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/pages/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCard extends StatelessWidget {
  ProductCategory category;
  Function categoryClicked;

  CategoryCard({this.category, this.categoryClicked});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      // TODO: implement build
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 3.0),
        child: SizedBox(
          width: 110,
          child: FlatButton(
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.grey[800],
                    width: 1,
                    style: (state.selectedCategory == this.category)
                        ? BorderStyle.solid
                        : BorderStyle.none),
                borderRadius: BorderRadius.circular(5)),
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.category,
                  color: Colors.grey[500],
                ),
                Text(
                  '${category.toString().split(".")[1]}',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              ],
            ),
            onPressed: () {
              if (this.categoryClicked != null)
                return categoryClicked(category);
            },
          ),
        ),
      );
    });
  }
}
