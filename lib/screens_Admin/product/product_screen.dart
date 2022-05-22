import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens_Admin/admin_model/admin_product_model.dart';

class AdminProductScreen extends StatelessWidget {
  const AdminProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Product Screen")),
        backgroundColor: kPrimaryColor,
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: AdminProduct.staticProducts.length,
                    itemBuilder: ((context, i) {
                      return SizedBox(
                          height: 210,
                          child: AdminProductCard(
                            adminProduct: AdminProduct.staticProducts[i],
                          ));
                    })),
              )
            ],
          ),
        ));
  }
}

class AdminProductCard extends StatelessWidget {
  final AdminProduct adminProduct;
  const AdminProductCard({
    Key? key,
    required this.adminProduct,
  }) : super(key: key);

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
                    height: 60,
                    width: 60,
                    child: Image.network(
                      adminProduct.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
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
                            min: 0,
                            max: 50,
                            divisions: 10,
                            thumbColor: Colors.black,
                            activeColor: Colors.orange[900],
                            inactiveColor: Colors.amber,
                            onChanged: (price) {}),
                        Text("RM " + adminProduct.price.toString(),style: TextStyle(fontWeight: FontWeight.bold,),)
                      ]),
                      Row(children: [
                        const Text(
                          "Qty",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Slider(
                            value: adminProduct.price,
                            min: 0,
                            max: 100,
                            divisions: 10,
                            thumbColor: Colors.black,
                            activeColor: Colors.orange[900],
                            inactiveColor: Colors.amber,
                            onChanged: (price) {}),
                        Text("${adminProduct.quantity.toInt()}",style: const TextStyle(fontWeight: FontWeight.bold),)
                      ])
                    ],
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
