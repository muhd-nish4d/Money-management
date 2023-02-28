import 'package:flutter/material.dart';

class ScreenUserEdit extends StatelessWidget {
  const ScreenUserEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 41, 72),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.check_rounded))
        ],
        backgroundColor: const Color.fromARGB(255, 14, 31, 51),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width * .95,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 14, 31, 51),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(blurRadius: 10, offset: Offset(0, 10))
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage('assets/images/project_user.jpg'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 206, 164, 52)),
                          child: const Text(
                            'Edit',
                            style: TextStyle(
                                color: Color.fromARGB(255, 14, 31, 51)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        //First TextFormField
                        SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width * .6,
                            child: TextFormField(
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 206, 164, 52)),
                              decoration: InputDecoration(
                                hintText: 'Enter your name',
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 114, 95, 41)),
                                label: const Text(
                                  'Name',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 206, 164, 52)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 206, 164, 52),
                                      width: 2),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 206, 164, 52),
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        //Second TextFormField
                        SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width * .6,
                            child: TextFormField(
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 206, 164, 52)),
                              decoration: InputDecoration(
                                hintText: 'Type here',
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 114, 95, 41)),
                                label: const Text(
                                  'Subtitle',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 206, 164, 52)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 206, 164, 52),
                                      width: 2),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 206, 164, 52),
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, 41, 72)
//font = Inter

