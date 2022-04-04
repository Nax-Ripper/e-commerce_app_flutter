// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/model/Product_model.dart';
import 'package:e_commerce/widget/custom_appbar.dart';
import 'package:e_commerce/widget/custom_navbar.dart';
import 'package:e_commerce/widget/product_card.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "My Wishlist!"),
      bottomNavigationBar: CustomNavBar(),
      body: Container(
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3),
        child: GridView.builder(
          itemCount: Product.staticProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2.3,
          ),
          itemBuilder: (context, i) {
            return ProductCard(
              product: Product.staticProducts[i],
              isWishlist: true,
            );
          },
        ),
      ),
    );
  }
}
