// // ignore_for_file: prefer_const_constructors

// import 'package:e_commerce/model/Product_model.dart';
// import 'package:e_commerce/model/wishlist_model.dart';
// import 'package:e_commerce/widget/custom_appbar.dart';
// import 'package:e_commerce/widget/custom_navbar.dart';
// import 'package:e_commerce/widget/product_card.dart';
// import 'package:flutter/material.dart';

// class WishlistScreen extends StatefulWidget {
//   const WishlistScreen({Key? key}) : super(key: key);

//   @override
//   State<WishlistScreen> createState() => _WishlistScreenState();
// }

// class _WishlistScreenState extends State<WishlistScreen> {

 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppbar(title: "My Wishlist!"),
//       bottomNavigationBar: CustomNavBar(),
//       body: Container(
//         padding: EdgeInsetsDirectional.only(top: 20),
//         // margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3),
//         child: GridView.builder(
//           itemCount: Wishlist(product: []).product.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 1.15,
//           ),
//           itemBuilder: (context, i) {
//             return ProductCard(
//               product: Wishlist().product[i],
//               // isWishlist: true,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
