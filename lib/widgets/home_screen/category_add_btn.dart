import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../color/color.dart';
import '../../screens/category_main_screen.dart';

class WidgetCategoryAddBtn extends StatelessWidget {
  const WidgetCategoryAddBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backBlack,
      radius: 50,
      child: CircleAvatar(
          radius: 43,
          backgroundColor: Colors.black54,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => const ScreenCategory(),
              ));
            },
            icon: const Icon(
              Icons.difference_rounded,
              color: greyWhite,
              size: 35,
            ),
          )),
    );
  }
}
