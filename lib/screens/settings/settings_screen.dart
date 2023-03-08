import 'package:flutter/material.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 41, 72),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 31, 51),
        title: const Text(
          'Settings',
          style: TextStyle(color: Color.fromARGB(255, 206, 164, 52)),
        ),
      ),
      body: Column(
        children: const [
          ListTile(
            leading: Text(
              'About',
              style: TextStyle(color: Color.fromARGB(255, 206, 164, 52)),
            ),
          ),
          ListTile(
            leading: Text(
              'Reset',
              style: TextStyle(color: Color.fromARGB(255, 206, 164, 52)),
            ),
          ),
          ListTile(
            leading: Text(
              'Feedback',
              style: TextStyle(color: Color.fromARGB(255, 206, 164, 52)),
            ),
          ),
          ListTile(
            leading: Text(
              'Privacy Policy',
              style: TextStyle(color: Color.fromARGB(255, 206, 164, 52)),
            ),
          ),
          ListTile(
            leading: Text(
              'Terms and conditions',
              style: TextStyle(color: Color.fromARGB(255, 206, 164, 52)),
            ),
          )
        ],
      ),
    );
  }
}
//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, 41, 72)
//font = Inter
