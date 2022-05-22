import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/product/product_page.dart';
import 'package:e_commerce/screens_Admin/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel"),),
      backgroundColor: kPrimaryColor,
      body: SizedBox(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              // width: double.infinity,
              height: 150,
              
            child:  InkWell(
              child: Card(
                child: Center(child: Text("Go to Products"),
              ),),
              onTap: ()=>Get.to(AdminProductScreen()) ,
            ),
            )
          ],
        ),
      ),
    );
  }
}