// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/wishlist/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppbar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        //  backgroundColor: kPrimaryColor,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios),),
        elevation: 0,
        title: Center(
         
          child: Container(
            margin: EdgeInsets.only(top: 15,bottom: 10),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            
            decoration: BoxDecoration(
              // color: Colors.black,
               color: kPrimaryColor,
              borderRadius: BorderRadius.circular(5)
            ),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Get.to(WishlistScreen());
        //       },
        //       icon: Icon(Icons.favorite))
        // ]
        
        );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
