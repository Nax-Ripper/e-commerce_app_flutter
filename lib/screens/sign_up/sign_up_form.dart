// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/screens/home/home_page.dart';
import 'package:e_commerce/screens/sign_in/sign_in_form.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/widget/defaultButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formkey = GlobalKey<FormState>();

  // late String email, password, confirmnPassword;
  // String? email;
  // String? password;
  // String? confirmnPassword;
  // String? userName;
  // String? phoneNumber;

  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _Country = TextEditingController();
  final TextEditingController _ZipCode = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _username,
              textInputAction: TextInputAction.next,
              validator: (name) {
                if (name!.isEmpty) {
                  return kNamelNullError;
                }
                return null;
              },
              onSaved: (newName) {
                if (_formkey.currentState!.validate()) {
                  _username.text = newName!;
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
                controller: _email,
                textInputAction: TextInputAction.next,
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
                    _email.text = newEmail!;
                  }
                },
                decoration:
                    inputDeco("Email", "Enter your email", Icon(Icons.mail))),
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
              controller: _password,
              textInputAction: TextInputAction.next,
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
                  _password.text = newValue!;
                }
              },
              decoration:
                  inputDeco("Password", "Enter your password", Icon(Icons.key)),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
              controller: _confirmPassword,
              textInputAction: TextInputAction.next,
              obscureText: true,
              validator: (cPass) {
                if (cPass!.isEmpty) {
                  return kPassNullError;
                } else if (_confirmPassword.text != _password.text) {
                  return kMatchPassError;
                } else if (cPass.length < 8) {
                  return kShortPassError;
                }
                return null;
              },
              onSaved: (String? newPass) => _confirmPassword.text = newPass!,
              decoration: inputDeco("Confirm Password",
                  "Re-enter your password", Icon(Icons.key)),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
              controller: _phoneNumber,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              validator: (phone) {
                if (phone!.isEmpty) {
                  return kPhoneNumberNullError;
                }
                return null;
              },
              onSaved: (newPhone) {
                if (_formkey.currentState!.validate()) {
                  _phoneNumber.text = newPhone!;
                }
              },
              decoration: inputDeco(
                  "Phone", "Enter your Phone Number", Icon(Icons.phone)),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
              controller: _address,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.streetAddress,
              validator: (street) {
                if (street!.isEmpty) {
                  return "Enter street address";
                }
                return null;
              },
              onSaved: (street) {
                if (_formkey.currentState!.validate()) {
                  _address.text = street!;
                }
              },
              decoration: inputDeco("Street", "Enter your Street Address",
                  Icon(Icons.streetview)),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
              controller: _city,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.streetAddress,
              validator: (street) {
                if (street!.isEmpty) {
                  return "Enter city name";
                }
                return null;
              },
              onSaved: (street) {
                if (_formkey.currentState!.validate()) {
                  _city.text = street!;
                }
              },
              decoration: inputDeco(
                  "City", "Enter your City Name", Icon(Icons.location_city)),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
              controller: _Country,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.streetAddress,
              validator: (street) {
                if (street!.isEmpty) {
                  return "Enter Country Name";
                }
                return null;
              },
              onSaved: (street) {
                if (_formkey.currentState!.validate()) {
                  _Country.text = street!;
                }
              },
              decoration: inputDeco(
                  "Country", "Enter your Country", Icon(Icons.place_outlined)),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            TextFormField(
              controller: _ZipCode,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              validator: (street) {
                if (street!.isEmpty) {
                  return "Enter Zip Code";
                }
                return null;
              },
              onSaved: (street) {
                if (_formkey.currentState!.validate()) {
                  _ZipCode.text = street!;
                }
              },
              decoration: inputDeco(
                  "Zip Code", "Enter your Zip Code", Icon(Icons.numbers)),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
              text: "Sign In Me!",
              press: () async {
                if (_formkey.currentState!.validate()) {
                  _formkey.currentState!.save();

                  try {
                    await _auth.createUserWithEmailAndPassword(
                        email: _email.text, password: _password.text);
                    FirebaseFirestore db = FirebaseFirestore.instance;

                    MyUser userModel = MyUser();
                    User? user = _auth.currentUser;

                    // userModel.username = _username.text;
                    // userModel.uid = user!.uid.toString();
                    // userModel.email = user.email;
                    // userModel.phoneNumber = _phoneNumber.text;

                    await db.collection("users").doc(user!.uid).set({
                      "uid": user.uid.toString(),
                      "username": _username.text,
                      "email": user.email,
                      "phoneNumber": _phoneNumber.text,
                      "streetAddress": _address.text,
                      "city": _city.text,
                      "country": _Country.text,
                      "zipCode": _ZipCode.text,
                    });
                    Fluttertoast.showToast(msg: "Account Created Successfully");
                    Get.to(HomeScreen());
                  } catch (e) {
                    print(e.toString());
                    Fluttertoast.showToast(msg: e.toString());
                  }
                  // await _auth
                  //     .createUserWithEmailAndPassword(
                  //         email: _email.text, password: _password.text)
                  //     .then((value) => {
                  //           Future.delayed(
                  //               Duration(
                  //                 seconds: 1,
                  //               ), () {
                  //             // Get.back();
                  //             // postDetailsToFirestore();
                  //             // userModel.email = _email.text;
                  //             userModel.uid = _auth.currentUser!.uid;
                  //             userModel.username = _username.text;
                  //             userModel.email = _auth.currentUser!.email;
                  //             userModel.phoneNumber = _phoneNumber.text;

                  //              db.collection("users").doc(_auth.currentUser!.uid).set(userModel.toMap());
                  //             Get.to(HomeScreen());
                  //             // showModalBottomSheet<void>(
                  //             //   context: context,
                  //             //   builder: (BuildContext context) {
                  //             //     return SizedBox(
                  //             //       height: MediaQuery.of(context).size.height *
                  //             //           0.35,
                  //             //       child: Column(
                  //             //         children: [
                  //             //           SizedBox(
                  //             //             child: Column(
                  //             //               children: [
                  //             //                 SizedBox(
                  //             //                   height: 10,
                  //             //                 ),
                  //             //                 Text(
                  //             //                   "What type of buyer are you ?",
                  //             //                   style: TextStyle(fontSize: 20),
                  //             //                 ),
                  //             //                 SizedBox(
                  //             //                   height: 20,
                  //             //                 ),
                  //             //                 DefaultButton(
                  //             //                   text: "Normal Buyer",
                  //             //                   press: () async {
                  //             //                     Get.back();
                  //             //                     postDetailsToFirestore();
                  //             //                   },
                  //             //                 ),
                  //             //               ],
                  //             //             ),
                  //             //           ),
                  //             //           SizedBox(
                  //             //             height: 50,
                  //             //           ),

                  //             //           SizedBox(
                  //             //             child: Column(
                  //             //               children: [
                  //             //                 DefaultButton(
                  //             //                   text: "Batch Buyer",
                  //             //                   press: () async {
                  //             //                     // await db.collection("test").doc().set({"hello":12});
                  //             //                     Get.back();
                  //             //                     postDetailsToFirestore();
                  //             //                   },
                  //             //                 )
                  //             //               ],
                  //             //             ),
                  //             //           )
                  //             //           // ignore: prefer_const_constructors
                  //             //         ],
                  //             //       ),
                  //             //     );
                  //             //   },
                  //             // );
                  //           }),
                  //         })
                  //     .catchError((error) {
                  //   print(error.hashCode);
                  //   if (error.hashCode.toString() == "34618382") {
                  //     Fluttertoast.showToast(msg: "Email is Already taken!");
                  //   } else {
                  //     Fluttertoast.showToast(msg: error.toString());
                  //   }
                  //   // Fluttertoast.showToast(msg: error.toString());
                  // });
                  // // Future<bool> done = signUp(_email.text, _password.text);

                }
              },
            )
          ],
        ),
      ),
    );
  }

  Future<bool> signUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      // await _auth.createUserWithEmailAndPassword(email: email, password: password)
      //     .then((value) => {
      //           postDetailsToFirestore(),

      //         })
      //     .catchError((error) {
      //   Fluttertoast.showToast(msg: error.toString());
      // });

      try {
        var create = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await postDetailsToFirestore();
        return true;
      } on FirebaseAuthException catch (e) {
        print(e);
        Fluttertoast.showToast(msg: e.toString());
        return false;
      }
    } else {
      return false;
    }
    // return true;
  }

  Future<void> postDetailsToFirestore() async {
    // calling firebase
    // calling user model
    // sending values to firebase
    FirebaseFirestore db = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    print(user!.uid);

    MyUser userModel = MyUser();

    // assign values to MyUser class
    // userModel.username = _username.text;
    // userModel.uid = user.uid.toString();
    // userModel.email = user.email;
    // userModel.phoneNumber = _phoneNumber.text;

    await db.collection("users").doc(user.uid).set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfully");
  }
}
