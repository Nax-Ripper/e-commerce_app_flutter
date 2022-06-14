// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/bloc/cart/cart_bloc.dart';
import 'package:e_commerce/bloc/category/category_bloc.dart';
import 'package:e_commerce/bloc/checkout/checkout_bloc.dart';
import 'package:e_commerce/bloc/payment/payment_bloc.dart';
import 'package:e_commerce/bloc/product/product_bloc.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/repositories/categories/category_repo.dart';
import 'package:e_commerce/repositories/checkout/checkout_repo.dart';
import 'package:e_commerce/repositories/products/product_repo.dart';
import 'package:e_commerce/screens/checkout/checkout_page.dart';
import 'package:e_commerce/screens/splash/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CartBloc()..add(CartStarted()),
        ),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepo(),
          )..add(
              LoadCategories(),
            ),
        ),
        BlocProvider(create: (_) => PaymentBloc()..add(LoadPaymentMethod())),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepo(),
          )..add(
              LoadProduct(),
            ),
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            paymentBloc: context.read<PaymentBloc>(),
            checkoutRepo: CheckoutRepo(),
            
          ),
        ),
        
      ],
      child: GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Muli',
            textTheme: TextTheme(bodyText1: TextStyle(color: kTextColor)),
            appBarTheme: AppBarTheme(
                color: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle:
                    TextStyle(color: Color(0XFF8B8B8B), fontSize: 20)),
            primarySwatch: Colors.blue,
          ),
          home:
              // CheckoutScreen()
              SplashScreen()),
    );
  }
}
