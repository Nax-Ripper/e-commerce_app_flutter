// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/screens/sign_in/sign_in_body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In",),),
      body:SignInBody(),
    );
  }
}