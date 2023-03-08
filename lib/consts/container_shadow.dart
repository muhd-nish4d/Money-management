import 'package:flutter/material.dart';

BoxShadow containerShadow() {
 return const BoxShadow(
    color: Color.fromARGB(255, 0, 0, 0),
    blurRadius: 15.0, // soften the shadow
    spreadRadius: 2.0, //extend the shadow
    offset: Offset(
      0.0, // Move to right 5  horizontally
      10.0, // Move to bottom 5 Vertically
    ),
  );
}
