import 'package:flutter/material.dart';

import 'package:flutter_email_sender/flutter_email_sender.dart';

class ScreenSentFeedback extends StatelessWidget {
  const ScreenSentFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'enter email', border: OutlineInputBorder()),
          )
        ],
      ),
    );
  }
}


