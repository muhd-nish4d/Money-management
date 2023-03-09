import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tracker/consts/color.dart';

import '../../../widgets/appBar/appbar.dart';

class ScreenAbout extends StatelessWidget {
  const ScreenAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55),
          //AppBar
          child: WidgetAppBar(title: 'About')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Money Tracker',
              style: TextStyle(
                  color: backBlack, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10,),
            Text('Developed by Muhammed Nishad'),
            SizedBox(height: 10,),
            Text('Version 1.0.0'),
          ],
        ),
      ),
    );
  }
}
