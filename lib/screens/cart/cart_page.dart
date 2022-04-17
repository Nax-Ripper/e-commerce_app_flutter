// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce/model/cart_model.dart';
import 'package:e_commerce/screens/cart/cart_product_card.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/model/Product_model.dart';
import 'package:e_commerce/widget/custom_appbar.dart';
import 'package:e_commerce/widget/custom_navbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(title: "My Cart"),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Text(
                      "GO TO CHECKOUT",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    onPressed: () {})
              ],
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: Cart().cartProducts.length,
                      itemBuilder: (BuildContext context, i) {
                        return CartProductCard(product: Cart().cartProducts[i]);
                      },
                    ),
                  ),
       
                ],
              ),
            ),
            Column(
              children: [
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("SUBTOTAL", style: TextStyle(fontSize: 16)),
                      Text(
                       "RM "+Cart().subtotal.toString(),
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("DELIVERY FEE", style: TextStyle(fontSize: 16)),
                      Text(
                        "RM "+Cart().deliveryFee.toString(),
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      decoration:
                          BoxDecoration(color: Colors.black.withAlpha(50)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(5),
                      height: 60,
                      decoration: BoxDecoration(color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("TOTAL",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                            Text(
                              "RM "+Cart().total.toString(),
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}














            // Divider(thickness: 2,),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //     Text("SUBTOTAL",style: TextStyle(fontSize: 16)),
            //     Text("RM 5.55",style: TextStyle(fontSize: 16),)
            //   ],),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //     Text("DELIVERY FEE",style: TextStyle(fontSize: 16)),
            //     Text("RM 2.55",style: TextStyle(fontSize: 16),)
            //   ],),
            // ),
            // Stack(
            //   children: [
            //     Container(
            //       width: MediaQuery.of(context).size.width,
            //       height: 70,
            //       decoration: BoxDecoration(
            //         color: Colors.black.withAlpha(50)
            //       ),
            //     ),
            //     Container(
            //       width: MediaQuery.of(context).size.width,
            //       margin: EdgeInsets.all(5),
            //       height: 60,
            //       decoration: BoxDecoration(
            //         color: Colors.black
            //       ),

            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 30),
            //         child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //     Text("TOTAL",style: TextStyle(fontSize: 16,color: Colors.white)),
            //     Text("RM 20.55",style: TextStyle(fontSize: 16,color: Colors.white),)
            //   ],),
            //       ),
            //     )
            //   ],
            // )