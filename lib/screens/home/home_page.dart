// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/bloc/category/category_bloc.dart';
import 'package:e_commerce/bloc/product/product_bloc.dart';
import 'package:e_commerce/model/category_model.dart';

import 'package:e_commerce/widget/product_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce/model/Product_model.dart';
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
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CategoryLoaded) {
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 1.7,
                        viewportFraction: 0.85,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        // autoPlay: true,
                      ),
                      items: state.categories
                          .map((category) =>
                              HeroCarouselCard(category: category))
                          .toList(),
                      // items: Category.staticListCategory
                      //     .map((category) =>
                      //         HeroCarouselCard(category: category))
                      //     .toList(),
                    ),
                  );
                } else {
                  return Text("Simething went wrong");
                }
              },
            ),
            SectionTitle(
              title: "RECOMMENDED",
            ),
            // ProductCard(product: Product.staticProducts[1],)

            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }  if (state is ProductLoaded) {
                  return ProductCarousel(
                    productList: state.products
                        .where((element) => element.isRecomended)
                        .toList(),
                    // productList: Product.staticProducts
                    //     .where((element) => element.isRecomended)
                    //     .toList(),
                  );
                } else {
                  return Text("Simething went wrong");
                }
              },
            ),

            SectionTitle(
              title: "MOST POPULAR",
            ),

            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if(state is ProductLoading){
                   return Center(
                    child: CircularProgressIndicator(),
                  );
                }else if(state is ProductLoaded){

                    
                return ProductCarousel(
                  productList: state.products
                      .where((Product product) => product.isPopular == true)
                      .toList(),

                  // productList: Product.staticProducts
                  //     .where((Product product) => product.isPopular == true)
                  //     .toList(),
                );
             
             
                }else {
                  return Text("Simething went wrong");
                }

              },
            ),
          ],
        ),
      ),
    );
  }
}
