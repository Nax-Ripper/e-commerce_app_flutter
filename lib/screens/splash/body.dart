// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/home/home_page.dart';
import 'package:e_commerce/screens/sign_in/sign_in_page.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/widget/defaultButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(flex: 3, child: SplashContent()),
            // ignore: prefer_const_constructors
            Expanded(
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          "MSMS",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold),
        ),
        Text("Welcome to MSMS, Let's shop!"),
        Spacer(
          flex: 1,
        ),
        Image.asset(
          "assets/images/splash_2.png",
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
        Spacer(),
        DefaultButton(
          text: "Continue",
          press: () {
            Get.to(SignInScreen());
          },
        )
      ],
    );
  }
}
