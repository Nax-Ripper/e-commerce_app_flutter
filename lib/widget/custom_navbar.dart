
// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/main.dart';
import 'package:e_commerce/screens/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/home/home_page.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // color: Colors.black,
      color: kPrimaryColor,
      child: Container(
        height: 70,
        child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Get.to(HomeScreen());
                },
                icon: Icon(Icons.home, color: Colors.black,)),
                    IconButton(
                onPressed: () {
                  Get.to(CartScreen());
                },
                icon: Icon(Icons.shopping_cart,color: Colors.black,)),
                    IconButton(
                onPressed: () {
                  Get.to(HomeScreen());
                },
                icon: Icon(Icons.person,color: Colors.black,))
          ],
        ),
      ),
    );
  }
}
