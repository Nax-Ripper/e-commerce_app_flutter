// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:e_commerce/bloc/cart/cart_bloc.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/model/wishlist_model.dart';
import 'package:e_commerce/screens/cart/cart_page.dart';
import 'package:e_commerce/widget/hero_carousel_cart.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/model/Product_model.dart';
import 'package:e_commerce/widget/custom_appbar.dart';
import 'package:e_commerce/widget/custom_navbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(title: widget.product.name),
        bottomNavigationBar: BottomAppBar(
          color: kPrimaryColor,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // IconButton(
                //   icon: Icon(
                //     Icons.share,
                //     color: Colors.white,
                //   ),
                //   onPressed: () {},
                // ),
                // IconButton(
                //   icon: Icon(
                //     Icons.favorite,
                //     color: Colors.white,
                //   ),
                //   onPressed: () {
                //     Wishlist().addProduct(widget.product);
                //   },
                // ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        child: Text(
                          "ADD TO CART",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(CartProductAdded(widget.product));

                          Get.to(CartScreen());
                        });
                  },
                )
              ],
            ),
          ),
        ),
        body: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.7,
                viewportFraction: 0.85,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                // autoPlay: true,
              ),
              items: [HeroCarouselCard(product: widget.product)],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: Colors.black.withAlpha(50),
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width - 10,
                    height: 50,
                    alignment: Alignment.bottomCenter,
                    color: kPrimaryColor,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.product.name,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "RM " + widget.product.price.toString(),
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ExpansionTile(
                title: Text(
                  "Product Information",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
                initiallyExpanded: true,
                children: [
                  ListTile(
                    title: Text(widget.product.description)
                    
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ExpansionTile(
                title: Text(
                  "Delivery Information",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
                children: [
                  ListTile(
                    title: 
                    Text("- Only Online Payment is available \n- Our Rider will deliver this item to your doorsteps")
                  )
                ],
              ),
            )
          ],
        ));
  }
}
