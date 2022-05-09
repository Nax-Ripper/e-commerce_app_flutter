// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/bloc/product/product_bloc.dart';
import 'package:e_commerce/model/Product_model.dart';
import 'package:e_commerce/widget/product_card.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/widget/custom_appbar.dart';
import 'package:e_commerce/widget/custom_navbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogScreen extends StatelessWidget {
  final Category? categoryArguments;
  const CatalogScreen({
    Key? key,
    this.categoryArguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final List<Product> categoryProducts = Product.staticProducts
    //     .where((element) => element.category == categoryArguments!.name)
    //     .toList();

    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductLoaded) {
          final List<Product> categoryProducts = state.products
              .where((element) => element.category == categoryArguments!.name)
              .toList();
          return Scaffold(
            appBar: CustomAppbar(title: categoryArguments!.name),
            bottomNavigationBar: CustomNavBar(),
            body: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              itemCount: categoryProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.3),
              itemBuilder: (context, i) {
                return ProductCard(product: categoryProducts[i]);
              },
            ),
          );
        } else {
          return Text("Somethig went wrong!");
        }
      },
    );
  }
}
