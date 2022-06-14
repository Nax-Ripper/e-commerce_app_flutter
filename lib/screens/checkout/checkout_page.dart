// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/bloc/checkout/checkout_bloc.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/model/payment_method_model.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/screens/checkout/payment_selection_page.dart';
import 'package:e_commerce/screens/home/home_page.dart';
import 'package:e_commerce/screens/order_conformation/order_conformation_screen.dart';
import 'package:e_commerce/widget/custom_appbar.dart';
import 'package:e_commerce/widget/google_pay.dart';
import 'package:e_commerce/widget/order_summary.dart';
import 'package:emoji_alert/arrays.dart';
import 'package:emoji_alert/constants.dart';
import 'package:emoji_alert/emoji_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  MyUser loggedInUser = MyUser();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = MyUser.fromMap(value.data());
      setState(() {});
    });
  }

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
                    if (Platform.isAndroid) {
                      switch (state.paymentMethod) {
                        case PaymentMethod.google_pay:
                          return GestureDetector(
                            child: GooglePay(
                              product: state.products!,
                              total: state.total!,
                              // db: context.read<CheckoutBloc>().add(ConfirmCheckout(checkout: state.checkout))
                            ),
                            onTap: () {
                              context.read<CheckoutBloc>().add(
                                  ConfirmCheckout(checkout: state.checkout));

                              EmojiAlert(
                                      animationType: ANIMATION_TYPE.TRANSITION,
                                      emojiType: EMOJI_TYPE.LAUGHING,
                                      cancelable: false,
                                      enableMainButton: true,
                                      mainButtonText: Text("OK"),
                                      onMainButtonPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        HomeScreen()),
                                            ModalRoute.withName(
                                                '/') // Replace this with your root screen's route name (usually '/')
                                            );
                                      },
                                      description: Text(
                                          "Order placed Successfully!",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green[800])))
                                  .displayAlert(context);
                            },
                          );

                        case PaymentMethod.COD:
                          return ElevatedButton(
                            onPressed: () async {

                              context.read<CheckoutBloc>().add(
                                  ConfirmCheckout(checkout: state.checkout));

                                  if(state.checkout.subtotal!="0.0"){
                                      EmojiAlert(
                                      animationType: ANIMATION_TYPE.TRANSITION,
                                      emojiType: EMOJI_TYPE.LAUGHING,
                                      cancelable: false,
                                      enableMainButton: true,
                                      mainButtonText: Text("OK"),
                                      onMainButtonPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        HomeScreen()),
                                            ModalRoute.withName(
                                                '/') // Replace this with your root screen's route name (usually '/')
                                            );
                                      },
                                      description: Text(
                                          "Order placed Successfully!",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green[800])))
                                  .displayAlert(context);


                                  }

                            
                              // Get.to(OrderConfirmation());
                            },
                            child: Text("Pay with Cash On Delivery"),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                            ),
                          );
                        default:
                          return GooglePay(
                            product: state.products!,
                            total: state.total!,
                          );
                      }
                    } else if (Platform.isIOS) {
                      // return  GooglePay(product: state.products!, total: state.total!,);
                    } else {
                      return ElevatedButton(
                          onPressed: () => Get.to(PaymentSelection()),
                          child: Text("CHOOSE PAYMENT"));
                    }

                    // return ElevatedButton(
                    //     style: ElevatedButton.styleFrom(primary: Colors.white),
                    //     // ignore: prefer_const_constructors
                    //     child: Text(
                    //       "ORDER NOW !",
                    //       style: TextStyle(
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.black),
                    //     ),
                    //     onPressed: () {
                    //       context
                    //           .read<CheckoutBloc>()
                    //           .add(ConfirmCheckout(checkout: state.checkout));

                    //       Get.to(OrderConfirmation());

                    //       // if (state.checkout.subtotal != "0.0") {
                    //       //   EmojiAlert(
                    //       //     animationType: ANIMATION_TYPE.TRANSITION,
                    //       //     description: Column(
                    //       //       children: [
                    //       //         Center(
                    //       //           child: Text(
                    //       //             "Order placed successfully!",
                    //       //             style: TextStyle(
                    //       //                 fontWeight: FontWeight.bold),
                    //       //           ),
                    //       //         ),
                    //       //         SizedBox(
                    //       //           child: Icon(
                    //       //             Icons.check,
                    //       //             color: Colors.green,
                    //       //             size: 50,
                    //       //           ),
                    //       //         ),
                    //       //       ],
                    //       //     ),
                    //       //   ).displayAlert(context);
                    //       // }
                    //     });

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
            Row(
              children: [
                SizedBox(
                  width: 75,
                  child: Text(
                    "Name",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                // Text("Name :"),
                Text(loggedInUser.username.toString()),
              ],
            ),

            Row(
              children: [
                SizedBox(
                  width: 75,
                  child: Text(
                    "Email",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Text(loggedInUser.email.toString()),
              ],
            ),
            // _buildTextFormField(emailController, context, "Email"),
            // _buildTextFormField(nameController, context, "Full Name"),
            Text(
              "DELIVERY INFORMATION",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                SizedBox(
                  width: 75,
                  child: Text(
                    "Street Address",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Text(loggedInUser.streetAddress.toString()),
              ],
            ),

            Row(
              children: [
                SizedBox(
                  width: 75,
                  child: Text(
                    "City",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Text(loggedInUser.city.toString()),
              ],
            ),

            Row(
              children: [
                SizedBox(
                  width: 75,
                  child: Text(
                    "Country",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Text(loggedInUser.country.toString()),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 75,
                  child: Text(
                    "Zip Code",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Text(loggedInUser.zipCode.toString()),
              ],
            ),
            // _buildTextFormField(addressController, context, "Address"),
            // _buildTextFormField(cityController, context, "City"),
            // _buildTextFormField(countryController, context, "Country"),
            // _buildTextFormField(zipcodeController, context, "Zip Code"),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.to(PaymentSelection());
                        // Navigator.pushNamed(
                        //   context,
                        //   '/payment-selection',
                        // );
                      },
                      child: Text(
                        'SELECT A PAYMENT METHOD',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
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
