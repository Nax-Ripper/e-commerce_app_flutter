import 'package:e_commerce/constants.dart';
import 'package:e_commerce/model/Product_model.dart';
import 'package:e_commerce/widget/custom_appbar.dart';
import 'package:e_commerce/widget/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: "Order Confirmation"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                  // color: Colors.black,
                  width: double.infinity,
                  height: 400,
                ),
                Positioned(
                    top: 10,
                    left: 20,
                    child: Image.asset(
                      "assets/images/Order_Confirm.jpg",
                      fit: BoxFit.fitWidth,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ORDER CODE : 5256548",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Thank you for purchasing on MSMS",
                    style: TextStyle(fontSize: 17),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "ORDER CODE : 5256548",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const OrderSummary(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Order Details",
                    style: TextStyle(fontSize: 17),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Order_Summary(product: Product.staticProducts[0],quantity:2,),
                  Order_Summary(product: Product.staticProducts[1],quantity:5,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Order_Summary extends StatelessWidget {
   Order_Summary({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);
  Product product;
  int quantity;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Row(
          children: [
            Image.network(
              product.imageURL,
              fit: BoxFit.cover,
              height: 90,
              width: 100,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 18),
                  ),
                   Text("Qty : $quantity", style: TextStyle(fontSize: 14))
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "RM " + product.price.toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
