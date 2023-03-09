import 'package:flutter/material.dart';
import 'package:tracker/consts/color.dart';
import 'package:tracker/screens/settings/settings_screen.dart';

class WidgetDrawer extends StatelessWidget {
  const WidgetDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15), topRight: Radius.circular(15))),
      backgroundColor: backBlack,
      child: Column(
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
            width: MediaQuery.of(context).size.width * .7,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: backBlack),
              onPressed: () {},
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: blueGreenGrad,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                    Icon(
                      Icons.ios_share_rounded,
                      color: backBlack,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'Share',
                      style: TextStyle(
                          color: backBlack, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              // icon: const Icon(
              //   Icons.ios_share_rounded,
              //   color: Color.fromARGB(255, 14, 31, 51),
              // ),
              // label: const Text(
              //   'Share',
              //   style: TextStyle(
              //       color: Color.fromARGB(255, 14, 31, 51),
              //       fontWeight: FontWeight.bold),
              // ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //Settings button
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width * .7,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: backBlack),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const ScreenSettings(),
                ));
              },
              child:  Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: blueGreenGrad,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                    Icon(
                      Icons.settings,
                      color: backBlack,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'Settings',
                      style: TextStyle(
                          color: backBlack, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, 41, 72)
//font = Inter
