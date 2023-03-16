import 'package:flutter/material.dart';
import 'package:tracker/consts/color.dart';

class ScreenPrivacyPolicy extends StatelessWidget {
  const ScreenPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children:  [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: const Icon(Icons.arrow_back)),
                const Text('Privacy Policy',style: TextStyle(decoration: TextDecoration.none,color:backBlack, fontSize: 20),),
                const SizedBox()
              ],
            ),
            const SizedBox(height: 20,),
            const Text(
              '''At our money management app,''',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: backBlack,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              '''

we are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy explains how we collect, use, and protect your personal information. 

Information We Collect
We may collect the following information from you when you use our app:

 * Your device information such as IP address and device type when you access our app.

Use of Your Information

We use your personal information to provide our services to you, such as tracking your expenses, creating a budget, and providing financial advice. We may also use your information for the following purposes:

* To improve our app and services.

* To communicate with you about updates to our app and services.

* To comply with legal and regulatory requirements.

* We may also use your non-personal information, such as your usage data, to analyze app usage trends and improve our app and services.

''',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 13,
                  color: backBlack),
            ),
            const Text(
              'Sharing of Your Information:-',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  color: backBlack),
            ),
            const Text(
              '''


* We do not sell or rent your personal information to third parties. However, we may share your information with the following third parties:

* Service providers who assist us in providing our services to you.

* Law enforcement or government agencies when required by law or to protect our legal rights.

* We may also share your non-personal information with third parties for marketing or advertising purposes.

''',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 13,
                  color: backBlack),
            ),
            const Text(
              'Data Security',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  color: backBlack),
            ),
            const Text(
              '''


* We take reasonable steps to ensure the security of your personal information. We use industry-standard security measures to protect your information from unauthorized access, disclosure, or modification. However, no method of transmission over the internet or electronic storage is completely secure, and we cannot guarantee the absolute security of your information.

''',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 13,
                  color: backBlack),
            ),
            const Text(
              'Your Rights',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  color: backBlack),
            ),
            const Text(
              '''


You have the right to access, correct, or delete your personal information. You may also object to our processing of your information or restrict our processing of your information. To exercise these rights, please contact us using the contact information provided below.

''',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 13,
                  color: backBlack),
            ),
            const Text(
              'Updates to this Privacy Policy',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  color: backBlack),
            ),
            const Text(
              '''


We may update this Privacy Policy from time to time. We will notify you of any material changes by posting the updated Privacy Policy on our app or by emailing you.''',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 13,
                  color: backBlack),
            )
          ],
        ),
      )),
    );
  }
}


// Contact Us
// If you have any questions or concerns about this Privacy Policy or our practices, please contact us at [insert contact information].