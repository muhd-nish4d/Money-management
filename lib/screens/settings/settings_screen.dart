import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:tracker/consts/color.dart';
import 'package:tracker/screens/settings/screens/about_screen.dart';
import 'package:tracker/screens/settings/screens/privacy_policy.dart';
import 'package:tracker/screens/settings/screens/reset.dart';
import 'package:tracker/screens/settings/screens/terms_conditions.dart';
import '../../widgets/appBar/appbar.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backBlack,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(55),
          //AppBar
          child: WidgetAppBar(title: 'Settings')),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const ScreenAbout()));
            },
            leading: const Text(
              'About',
              style: TextStyle(color: greyWhite),
            ),
          ),
          ListTile(
            onTap: () {
              resetAlert(context);
            },
            leading: const Text(
              'Reset',
              style: TextStyle(color: greyWhite),
            ),
          ),
          ListTile(
            onTap: (){
               sendEmail();
            },
            leading: const Text(
              'Feedback',
              style: TextStyle(color: greyWhite),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const ScreenPrivacyPolicy()));
            },
            leading: const Text(
              'Privacy Policy',
              style: TextStyle(color: greyWhite),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const ScreenTermsandConditions()));
            },
            leading: const Text(
              'Terms and conditions',
              style: TextStyle(color: greyWhite),
            ),
          )
        ],
      ),
    );
  }
}
sendEmail() async {
  final Email email =  Email(
    body: 'HELP!',
    subject: 'Problem',
    recipients: ['mn0265616@gmail.com'],
    isHTML: false,
  );
 await FlutterEmailSender.send(email);
 log(email.toString());
}
//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, 41, 72)
//font = Inter
