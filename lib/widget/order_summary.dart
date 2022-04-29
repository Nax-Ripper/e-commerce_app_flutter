import 'package:e_commerce/bloc/cart/cart_bloc.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          Center(
            child: CircularProgressIndicator(),
          );
        } if (state is CartLoaded) {
          return Column(
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
                      "RM " + state.cart.subtotal.toString(),
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
                      "RM " + state.cart.deliveryFee.toString(),
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
                    decoration: BoxDecoration(color: kPrimaryColor),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("TOTAL",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black)),
                          Text(
                            "RM " + state.cart.total.toString(),
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        } else {
          return Text("Something went wrong");
        }
      },
    );
  }
}
