// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_commerce/model/Product_model.dart';
import 'package:e_commerce/screens/product/product_page.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool? isWishlist;
  const ProductCard({
    Key? key,
    required this.product,
     this.isWishlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(ProductScreen(product: product)),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2.5,
            child: Image.network(
              product.imageURL,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: 5,
            bottom: 5,
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width/2.4 ,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
              child: Padding(
                 padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "RM" + Product.staticProducts[1].price.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: IconButton(
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                
                    ),
                  
                    isWishlist==true? Expanded(
                        child: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )):SizedBox()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
