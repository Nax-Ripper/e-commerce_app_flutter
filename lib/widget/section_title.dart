// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.symmetric(horizontal: 20,),
      child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
             title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          )),
    );
  }
}
