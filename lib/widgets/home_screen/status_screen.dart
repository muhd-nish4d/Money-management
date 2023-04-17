import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/amount/amount_bloc.dart';
import '../../consts/color.dart';

//==================================After Bloc=========================================
ValueNotifier val = ValueNotifier(0);
//==================================After Bloc=========================================

class WidgetSatusScreen extends StatelessWidget {
  const WidgetSatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<AmountBloc>(context).add(AmountInitialEvent());
    return Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
            gradient: blueGreenGrad,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0),
                blurRadius: 15.0, // soften the shadow
                spreadRadius: 2.0, //extend the shadow
                offset: Offset(
                  0.0, // Move to right 5  horizontally
                  10.0, // Move to bottom 5 Vertically
                ),
              )
            ]),
        //rgb(57, 62, 70)
        //rgb(109, 152, 134)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BlocBuilder<AmountBloc, AmountState>(
              builder: (context, state) {
                if (state is AmountLoadingState) {
                  return Center(child: CircularProgressIndicator(),);
                }
                else if (state is AmountShowState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 110,
                        width: 300,
                        child: Card(
                          elevation: 10,
                          color: backBlack,
                          child: Column(children: [
                            state.totalAmount >= 0
                                ? const Text(
                                    'Total',
                                    style: TextStyle(
                                        color: greyWhite,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  )
                                : const Text(
                                    'Lose',
                                    style: TextStyle(
                                        color: greyWhite,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                '₹${state.totalAmount}',
                                style: state.totalAmount < 0
                                    ? const TextStyle(
                                        overflow: TextOverflow.fade,
                                        // rgb(242, 231, 213)
                                        color: greyWhite,
                                        fontSize: 40,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.bold)
                                    : const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        // rgb(242, 231, 213)
                                        color: greyWhite,
                                        fontSize: 40,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                            
                          ]),
                        ),
                      ),
                      Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.arrow_upward_rounded,
                                            color: backBlack,
                                          ),
                                          Text(
                                            'Income',
                                            style: TextStyle(
                                                color: backBlack,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 35,
                                        width: 125,
                                        child: Center(
                                            child: Text(
                                          '₹${state.incomeAmount}',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: backBlack,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Inter'),
                                        )),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.arrow_downward_rounded,
                                            color: backBlack,
                                          ),
                                          Text(
                                            'Expense',
                                            style: TextStyle(
                                                color: backBlack,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 125,
                                        height: 35,
                                        child: Center(
                                            child: Text(
                                          '₹${state.expenceAmount}',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: backBlack,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Inter'),
                                        )),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          backgroundColor: backBlack),
                                      onPressed: () {
                                        //==================================After Bloc=========================================
                                        // Navigator.of(context).push(MaterialPageRoute(
                                        //     builder: (ctx) => const ScreenCircleChart()));
                                        // Amounts().totalAmount();
                                        //==================================After Bloc=========================================
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 9),
                                        child: Column(
                                          children: const [
                                            Icon(Icons.analytics_rounded,
                                                color: greyWhite),
                                            SizedBox(),
                                            Text(
                                              'Observe',
                                              style: TextStyle(
                                                color: greyWhite,
                                              ),
                                            )
                                          ],
                                        ),
                                      ))
                                ]),
                    ],
                  );
                } else {
                  return Text('some error');
                }
              },
            ),
            // ValueListenableBuilder(
            //   //==================================After Bloc=========================================
            //   // valueListenable: Amounts.instance.totalResult,
            //   valueListenable: val,
            //   //==================================After Bloc=========================================
            //   builder: (context, value, child) {
            //     return SizedBox(
            //       height: 110,
            //       width: 300,
            //       child: Card(
            //         elevation: 10,
            //         color: backBlack,
            //         child: Column(children: [
            //           value >= 0
            //               ? const Text(
            //                   'Total',
            //                   style: TextStyle(
            //                       color: greyWhite,
            //                       fontSize: 25,
            //                       fontWeight: FontWeight.bold),
            //                 )
            //               : const Text(
            //                   'Lose',
            //                   style: TextStyle(
            //                       color: greyWhite,
            //                       fontSize: 25,
            //                       fontWeight: FontWeight.bold),
            //                 ),
            //           Padding(
            //             padding: const EdgeInsets.only(left: 15),
            //             child: Text(
            //               '₹$value',
            //               style: value < 0
            //                   ? const TextStyle(
            //                       overflow: TextOverflow.fade,
            //                       // rgb(242, 231, 213)
            //                       color: greyWhite,
            //                       fontSize: 40,
            //                       fontFamily: 'Inter',
            //                       fontWeight: FontWeight.bold)
            //                   : const TextStyle(
            //                       overflow: TextOverflow.ellipsis,
            //                       // rgb(242, 231, 213)
            //                       color: greyWhite,
            //                       fontSize: 40,
            //                       fontFamily: 'Inter',
            //                       fontWeight: FontWeight.bold),
            //             ),
            //           )
            //         ]),
            //       ),
            //     );
            //   },
            // ),
          ],
        )
        // ],
        );
    // );
  }
}
