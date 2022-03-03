// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/model/Product_model.dart';
import 'package:flutter/material.dart';

import 'product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> productList;
  const ProductCarousel({
    Key? key,
    required this.productList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 165,
        child: ListView.builder(
          shrinkWrap: false,
          
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: productList.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.only(right:8.0),
              child: ProductCard(product: productList[i]),
            );
          },
        ),
      ),
    );
  }
}