// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/bloc/category/bloc/category_bloc.dart';
import 'package:e_commerce/widget/product_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'package:e_commerce/model/Product_model.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/widget/custom_appbar.dart';
import 'package:e_commerce/widget/custom_navbar.dart';
import 'package:e_commerce/widget/hero_carousel_cart.dart';
import 'package:e_commerce/widget/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "My eCommerce!"),
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: 
                      CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 1.7,
                        viewportFraction: 0.85,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        // autoPlay: true,
                      ),
                      items: Category.staticListCategory
                          .map((category) =>
                              HeroCarouselCard(category: category))
                          .toList()),
              
              // BlocBuilder<CategoryBloc, CategoryState>(
              //   builder: (context, state) {
              //     if (state is CategoryLoading) {
              //       return Center(child: CircularProgressIndicator());
              //     }
              //     if (state is CategoryLoaded) {
              //       return CarouselSlider(
              //         options: CarouselOptions(
              //           aspectRatio: 1.7,
              //           viewportFraction: 0.85,
              //           enlargeStrategy: CenterPageEnlargeStrategy.height,
              //           enlargeCenterPage: true,
              //           enableInfiniteScroll: true,
              //           // autoPlay: true,
              //         ),
              //         // items: Category.staticListCategory
              //         //     .map((category) =>
              //         //         HeroCarouselCard(category: category))
              //         //     .toList(),
              //         items: state.category
              //             .map((category) =>
              //                 HeroCarouselCard(category: category))
              //             .toList(),
              //       );
              //     } else {
              //       return Text("Something went wrong");
              //     }
              //   },
              // ),
            ),
            SectionTitle(
              title: "RECOMMENDED",
            ),
            // ProductCard(product: Product.staticProducts[1],)

            ProductCarousel(
              productList: Product.staticProducts
                  .where((element) => element.isRecomended)
                  .toList(),
            ),

            SectionTitle(
              title: "MOST POPULAR",
            ),

            ProductCarousel(
              productList: Product.staticProducts
                  .where((Product product) => product.isPopular == true)
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
