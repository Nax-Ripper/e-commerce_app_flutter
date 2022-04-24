// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/screens/sign_in/sign_in_page.dart';
import 'package:e_commerce/widget/custom_appbar.dart';
import 'package:e_commerce/widget/defaultButton.dart';
import 'package:e_commerce/widget/info_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    return Scaffold(
      appBar: const CustomAppbar(title: "Profile"),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                  elevation: 20,
                  shadowColor: Colors.amber[600],
                  shape: const CircleBorder(),
                  color: kPrimaryColor.withOpacity(0.7),
                  child: ClipOval(
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset("assets/profile_image/profile_pic.png",
                          fit: BoxFit.cover),
                    ),
                  )),
            ),
            InfoCard(
              text: loggedInUser.username.toString(),
              icon: Icons.person,
            ),
            InfoCard(
              text: loggedInUser.email.toString(),
              icon: Icons.email,
            ),
            InfoCard(
              text: loggedInUser.phoneNumber.toString(),
              icon: Icons.phone,
            ),
            const SizedBox(
              height: 30,
            ),
            DefaultButton(
              text: "Log Out",
              press: () {
                FirebaseAuth.instance.signOut();
                // Navigator.pushAndRemoveUntil(context, newRoute, (route) => false)
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SignInScreen(),
                  ),
                  (route) => false,
                );

                // Get.back();
                // Get.to(SignInScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
