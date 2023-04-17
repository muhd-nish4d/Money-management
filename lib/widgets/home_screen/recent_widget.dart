import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/blocs/filter/filter_bloc.dart';
import '../../consts/color.dart';
import '../../screens/search/search_screen.dart';
import '../transactions/recent_transations.dart';

class WidgetRecentScreen extends StatelessWidget {
  const WidgetRecentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        // boxShadow: const [
        //     BoxShadow(
        //       color: Color.fromARGB(255, 0, 0, 0),
        //       blurRadius: 15.0, // soften the shadow
        //       spreadRadius: 2.0, //extend the shadow
        //       offset: Offset(
        //         10.0, // Move to right 5  horizontally
        //         10.0, // Move to bottom 5 Vertically
        //       ),
        //     )
        //   ],
        gradient: blueGreenGrad,
        borderRadius: BorderRadius.circular(10),
        //rgb(109, 152, 134)
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent',
                  style: TextStyle(
                      color: backBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                TextButton(
                    onPressed: () {
                      BlocProvider.of<FilterBloc>(context)
                          .add(const FilterDataEvent('all'));
                      showSearch(
                        context: context,
                        delegate: ScreenSearch(),
                        // useRootNavigator: false
                      );
                    },
                    child: const Text(
                      'View all',
                      style: TextStyle(color: backBlack),
                    ))
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: WidgetRecentTransactions()),
        ],
      ),
    );
  }
}
