// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/bloc/cart/cart_bloc.dart';
import 'package:e_commerce/bloc/category/bloc/category_bloc.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/repositories/categories/category_repo.dart';
import 'package:e_commerce/screens/splash/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  

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
          create: (context) => CartBloc()..add(CartStarted()),
        ),
        BlocProvider(
          create: (_) =>
              CategoryBloc(categoryRepo: CategoryRepo())
        )
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
          home: SplashScreen()),
    );
  }
}
