import 'package:flutter/material.dart';
import 'package:tracker/consts/color.dart';

class ScreenTermsandConditions extends StatelessWidget {
  const ScreenTermsandConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: SafeArea(
          child: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
    '''Welcome to Money Tracker, a money management app designed to help you track your finances and manage your money. By using this app, you agree to be bound by the following terms and conditions:

General Terms
a. Money Tracker is a mobile application that allows users to track their finances, manage their budgets, and set financial goals.

b. Money Tracker is not a financial advisor, and any information provided in the app is for educational purposes only. You should consult a financial advisor before making any financial decisions.

c. Money Tracker is provided on an "as is" basis, and we do not guarantee the accuracy, completeness, or reliability of the information provided in the app.

d. You are responsible for maintaining the confidentiality of your account information, including your login credentials. You are also responsible for all activities that occur under your account.

User Content
a. Money Tracker allows you to upload and store information related to your finances, such as transaction details, budget information, and financial goals.

b. You retain ownership of all content that you upload to the app. By uploading content, you grant Money Tracker a non-exclusive, transferable, sub-licensable, royalty-free, worldwide license to use, modify, reproduce, distribute, and display the content in connection with the app.

c. You are responsible for the accuracy and legality of any content that you upload to the app.

Payment and Subscription
a. Money Tracker offers a free version of the app, as well as a premium version with additional features.

b. Payment for the premium version of the app is made through the app store where you downloaded the app.

c. Subscription fees are charged on a monthly or yearly basis, depending on the subscription plan you choose.

d. You may cancel your subscription at any time, but no refunds will be given for any unused portion of your subscription.

Limitation of Liability
a. Money Tracker is not responsible for any damages or losses that may result from your use of the app, including but not limited to direct, indirect, incidental, special, or consequential damages.

b. Money Tracker is not responsible for any damages or losses that may result from the actions of third-party providers, such as financial institutions and payment processors.

c. Money Tracker's liability to you for any cause whatsoever, and regardless of the form of the action, will at all times be limited to the amount paid, if any, by you to Money Tracker for the app during the term of your use of the app.

Governing Law
a. These terms and conditions are governed by and construed in accordance with the laws of the jurisdiction in which Money Tracker is headquartered.

b. Any disputes arising out of or in connection with these terms and conditions will be subject to the exclusive jurisdiction of the courts of the jurisdiction in which Money Tracker is headquartered.

By using Money Tracker, you agree to these terms and conditions. If you do not agree to these terms and conditions, you should not use the app.''',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: backBlack,
                  fontSize: 13),
            ),
          )
        ],
      )),
    );
  }
}
