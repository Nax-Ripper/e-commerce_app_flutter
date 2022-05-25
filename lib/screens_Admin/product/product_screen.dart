import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/screens_Admin/product/add_product_screen.dart';
import 'package:e_commerce/screens_Admin/services/database_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens_Admin/admin_model/admin_product_model.dart';
import 'package:e_commerce/screens_Admin/controllers/product_Controller.dart';

class AdminProductScreen extends StatelessWidget {
  AdminProductScreen({Key? key}) : super(key: key);

  final ProductController productContoller = Get.put(ProductController());
  DatabaseService databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Product Screen",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        // appBar: AppBar(title: Text("Product Screen")),
        backgroundColor: kPrimaryColor,
        body: Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Card(
                  elevation: 10,
                  color: Colors.black,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.to(AddProductScreen());
                          },
                          icon: const Icon(
                            Icons.add_box,
                            color: kPrimaryColor,
                          )),
                      const Text(
                        "Add a new product",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      )
                    ],
                  )),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                    // itemCount: AdminProduct.staticProducts.length,
                    itemCount: productContoller.adminProduct.length,
                    itemBuilder: ((context, i) {
                      return (SizedBox(
                          height: 210,
                          child: AdminProductCard(
                            i: i,
                            // adminProduct: AdminProduct.staticProducts[i],
                            adminProduct: productContoller.adminProduct[i],
                          )));
                    })),
              ),
            )
          ],
        ));
  }
}

class AdminProductCard extends StatelessWidget {
  final AdminProduct adminProduct;
  final int i;
  AdminProductCard({
    Key? key,
    required this.adminProduct,
    required this.i,
  }) : super(key: key);

  final ProductController productContoller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 10,),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                adminProduct.name,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                adminProduct.description,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.network(
                      adminProduct.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          const Text(
                            "Price",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Slider(
                            value: adminProduct.price,
                            min: 1,
                            max: 50,
                            divisions: 10,
                            thumbColor: Colors.black,
                            activeColor: Colors.orange[900],
                            inactiveColor: Colors.amber,
                            onChanged: (price) {
                              productContoller.updateProductPrice(
                                  i, adminProduct, price);
                            },
                            onChangeEnd: (value) {
                              print(value);
                              productContoller.saveNewProductPrice(
                                  adminProduct, "price", value);
                            },
                          ),
                          Text(
                            "RM " + adminProduct.price.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]),
                        Row(children: [
                          const Text(
                            "Qty",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Slider(
                            value: adminProduct.quantity.toDouble(),
                            min: 0,
                            max: 100,
                            divisions: 10,
                            thumbColor: Colors.black,
                            activeColor: Colors.orange[900],
                            inactiveColor: Colors.amber,
                            onChanged: (qty) {
                              productContoller.updateProductQuantity(
                                  i, adminProduct, qty.toInt());
                            },
                            onChangeEnd: (value) {
                              var qty = value.toString();
                              var qtyy = double.parse(qty);
                              var dqty = qtyy.truncate();
                              productContoller.saveNewProductQuantity(
                                  adminProduct,
                                  "quantity",
                                  value
                                  
                                  
                                  );
                            },
                          ),
                          Text(
                            "${adminProduct.quantity.toInt()}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        ])
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
