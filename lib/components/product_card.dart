import 'package:ecommerce/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  Function productClicked;
  final Product product;
  ProductCard({this.product, this.productClicked});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: InkWell(
        onTap: () {
          if (this.productClicked != null) return this.productClicked(product);
        },
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
              // color: Colors.red,
              child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      product.images.first,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        )),
                    top: 8,
                    left: 8,
                  ),
                  Positioned(
                    child: Icon(Icons.favorite_border),
                    top: 16,
                    left: 16,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    Text(
                      product.category.toString().split(".")[1],
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Colors.grey[500],
                          height: 1.2),
                    ),
                    Text(
                      product.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, height: 1.2),
                    ),
                    Text(
                      "${product.price.toString()} جم",
                      style:
                          TextStyle(fontWeight: FontWeight.w300, height: 1.2),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
