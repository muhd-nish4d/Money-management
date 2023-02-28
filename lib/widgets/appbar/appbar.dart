import 'package:flutter/material.dart';
import 'package:tracker/color/color.dart';

class WidgetAppBar extends StatelessWidget {
  String title;
  WidgetAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 57, 62, 70),
      iconTheme: IconThemeData(color: greyWhite),
      title: Text(
        title,
        style: TextStyle(color: greyWhite, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}

/*
final Color rose = Color.fromARGB(255, 255, 212, 212);
final Color greyWhite = Color.fromARGB(255, 255, 255, 232);
final Color green = Color.fromARGB(255, 205, 233, 144);
final Color darkGreen = Color.fromARGB(255, 170, 203, 115);
 */