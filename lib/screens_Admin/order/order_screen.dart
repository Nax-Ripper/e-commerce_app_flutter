import 'package:e_commerce/screens_Admin/admin_model/admin_product_model.dart';
import 'package:e_commerce/screens_Admin/controllers/order_Controller.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens_Admin/order/order_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);

  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text(
          "Orders",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                  itemCount: orderController.pendingOrder.length,
                  itemBuilder: (BuildContext context, index) {
                    return OrderCard(order: orderController.pendingOrder[index]);
                  }),
            ),
          )
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;
  OrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);
  final OrderController orderController = Get.find();
  @override
  Widget build(BuildContext context) {
    List<AdminProduct> products = AdminProduct.staticProducts
        .where((product) => order.productsIds.contains(product.id))
        .toList();
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Card(
        // margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Order ID :${order.id}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  DateFormat("dd-mm-yy").format(order.createdAt),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                )
              ]),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Card(
                        color: kPrimaryColor.withOpacity(0.8),

                        elevation: 10,
                        // borderOnForeground: true,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.network(
                                products[index].imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[index].name,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    products[index].description,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.clip,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(children: [
                    const Text(
                      "Delevery Fee",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${order.deliveryFee}",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  Column(children: [
                    const Text(
                      "Total",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${order.totall}",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ]),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  order.isAccepted ?
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green[700],
                        minimumSize: const Size(140, 40)),
                    onPressed: () {
                      orderController.updateOrder(
                          order, "isDelivered", !order.isDelivered);
                    },
                    child: const Text(
                      "Deliver",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ): ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green[700],
                        minimumSize: const Size(140, 40)),
                    onPressed: () {
                      orderController.updateOrder(
                          order, "isAccept", !order.isAccepted);
                    },
                    child: const Text(
                      "Accept",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  )

                  ,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red[800],
                        minimumSize: const Size(140, 40)),
                    onPressed: () {
                      orderController.updateOrder(
                          order, "isCancled", !order.isCancled);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 14),
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
