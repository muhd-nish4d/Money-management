import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:tracker/screens/settings_screen.dart';

class WidgetDrawer extends StatelessWidget {
  const WidgetDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   height: 200,
        //   width: double.infinity,
        //   decoration: const BoxDecoration(
        //       boxShadow: [
        //         BoxShadow(
        //             blurRadius: 10,
        //             color: Colors.black,
        //             spreadRadius: 1,
        //             offset: Offset(0, 10))
        //       ],
        //       borderRadius: BorderRadius.only(
        //           bottomLeft: Radius.circular(15),
        //           bottomRight: Radius.circular(15),
        //           topRight: Radius.circular(15)),
        //       image: DecorationImage(
        //           fit: BoxFit.cover,
        //           image: AssetImage(
        //             'assets/images/about_back.jpg',
        //           ))),
        //   child: SafeArea(
        //       child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         //Avatar, username, subtitle
        //         Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             const CircleAvatar(
        //               radius: 30,
        //               backgroundImage:
        //                   AssetImage('assets/images/project_user.jpg'),
        //             ),
        //             IconButton(
        //                 onPressed: () {
        //                   Navigator.of(context).push(MaterialPageRoute(
        //                       builder: (ctx) => const ScreenUserEdit()));
        //                 },
        //                 icon: const Icon(
        //                   Icons.edit,
        //                   color: Colors.white,
        //                 ))
        //           ],
        //         ),
        //         const SizedBox(
        //           height: 30,
        //         ),
        //         const Text(
        //           'User name',
        //           style: TextStyle(
        //               color: Colors.white,
        //               fontWeight: FontWeight.bold,
        //               fontSize: 25),
        //         ),
        //         const Text(
        //           'Subtitle',
        //           style: TextStyle(color: Colors.white),
        //         )
        //       ],
        //     ),
        //   )),
        // ),
        const SizedBox(
          height: 60,
        ),
        //Share button
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width * .6,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              

              
            },
            icon: const Icon(
              Icons.ios_share_rounded,
              color: Color.fromARGB(255, 14, 31, 51),
            ),
            label: const Text(
              'Share',
              style: TextStyle(
                  color: Color.fromARGB(255, 14, 31, 51),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        //Settings button
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width * .6,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => const ScreenSettings(),
              ));
            },
            icon: const Icon(
              Icons.settings,
              color: Color.fromARGB(255, 14, 31, 51),
            ),
            label: const Text(
              'Settings',
              style: TextStyle(
                  color: Color.fromARGB(255, 14, 31, 51),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, 41, 72)
//font = Inter
