// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce/bloc/checkout/checkout_bloc.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/widget/custom_appbar.dart';
import 'package:e_commerce/widget/order_summary.dart';
import 'package:emoji_alert/arrays.dart';
import 'package:emoji_alert/emoji_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController zipcodeController = TextEditingController();

    return Scaffold(
      appBar: CustomAppbar(title: "Checkout"),
      bottomNavigationBar: BottomAppBar(
        color: kPrimaryColor,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
                  if (state is CheckoutLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CheckoutLoaded) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        // ignore: prefer_const_constructors
                        child: Text(
                          "ORDER NOW !",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        onPressed: () {
                          context
                              .read<CheckoutBloc>()
                              .add(ConfirmCheckout(checkout: state.checkout));

                          if (state.checkout.subtotal != "0.0") {
                            EmojiAlert(
                              animationType: ANIMATION_TYPE.TRANSITION,
                              description: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      "Order placed successfully!",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 50,
                                    ),
                                  ),
                                ],
                              ),
                            ).displayAlert(context);
                          
                          }
                        });
                  }
                  return Text("Something went wrong!");
                },
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "CUSTOMER INFORMATION",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            _buildTextFormField(emailController, context, "Email"),
            _buildTextFormField(nameController, context, "Full Name"),
            Text(
              "DELIVERY INFORMATION",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            _buildTextFormField(addressController, context, "Address"),
            _buildTextFormField(cityController, context, "City"),
            _buildTextFormField(countryController, context, "Country"),
            _buildTextFormField(zipcodeController, context, "Zip Code"),
            Text(
              "ORDER SUMMARY",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            OrderSummary()
          ],
        ),
      ),
    );
  }

  Padding _buildTextFormField(TextEditingController textController,
      BuildContext context, String labelText) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Expanded(
              child: TextFormField(
            controller: textController,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor))),
          ))
        ],
      ),
    );
  }
}
