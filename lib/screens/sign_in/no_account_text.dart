import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/home/home_page.dart';
import 'package:e_commerce/sign_up/sign_up_page.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Get.to(SignUpPage()),
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
