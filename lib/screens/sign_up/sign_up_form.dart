// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/home/home_page.dart';
import 'package:e_commerce/screens/sign_in/sign_in_form.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/widget/defaultButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formkey = GlobalKey<FormState>();
  // late String email, password, confirmnPassword;
  String? email;
  // String? password;
  // String? confirmnPassword;
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String? userName;
  String? phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              validator: (name) {
                if (name!.isEmpty) {
                  return kNamelNullError;
                }
                return null;
              },
              onSaved: (newName) {
                if (_formkey.currentState!.validate()) {
                  userName = newName!;
                }
              },
              decoration: inputDeco(
                "Username",
                "Enter your username ",
                Icon(Icons.person),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                // ignore: prefer_const_constructors
                validator: (email) {
                  if (email!.isEmpty) {
                    return kEmailNullError;
                  } else if (!emailValidatorRegExp.hasMatch(email)) {
                    return kInvalidEmailError;
                  }
                  return null;
                },
                onSaved: (newEmail) {
                  if (_formkey.currentState!.validate()) {
                    email = newEmail!;
                  }
                },
                decoration:
                    inputDeco("Email", "Enter your email", Icon(Icons.mail))),
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
              controller: password,
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (pass) {
                if (pass!.isEmpty) {
                  return kPassNullError;
                } else if (pass.length < 8) {
                  return kShortPassError;
                }
                return null;
              },
              onSaved: (newValue) {
                if (_formkey.currentState!.validate()) {
                  password.text = newValue!;
                }
              },
              decoration:
                  inputDeco("Password", "Enter your password", Icon(Icons.key)),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
              controller: confirmPassword,
              obscureText: true,
              validator: (cPass) {
                if (cPass!.isEmpty) {
                  return kPassNullError;
                } else if (confirmPassword.text != password.text) {
                  return kMatchPassError;
                } else if (cPass.length < 8) {
                  return kShortPassError;
                }
                return null;
              },
              onSaved: (String? newPass) => confirmPassword.text = newPass!,
              decoration: inputDeco("Confirm Password",
                  "Re-enter your password", Icon(Icons.key)),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
              keyboardType: TextInputType.phone,
              validator: (phone) {
                if (phone!.isEmpty) {
                  return kPhoneNumberNullError;
                }
                return null;
              },
              onSaved: (newPhone) {
                if (_formkey.currentState!.validate()) {
                  phoneNumber = newPhone;
                }
              },
              decoration: inputDeco(
                  "Phone", "Enter your Phone Number", Icon(Icons.phone)),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
              text: "Sign In Me!",
              press: () {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();
                 
                  Future.delayed(
                      Duration(
                        seconds: 1,
                      ), () {
                         Get.back();
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // ignore: prefer_const_constructors
                            Text(
                              "What type of buyer are you ?",
                              style: TextStyle(fontSize: 20),
                            ),
                            DefaultButton(
                              text: "Normal Buyer",
                              press: () {
                                Get.back();
                                return Get.to(HomeScreen());
                              },
                            ),
                            DefaultButton(
                              text: "Batch Buyer",
                              press: () {
                                Get.back();
                                return Get.to(HomeScreen());
                              },
                            )
                          ],
                        );
                      },
                    );
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

// class ShowBottomSheet extends StatelessWidget {
//   const ShowBottomSheet({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: sh,
//     );
//   }
// }
