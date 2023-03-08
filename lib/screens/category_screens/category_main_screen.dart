import 'package:flutter/material.dart';
import 'package:tracker/db_functions/category/category_db_functions.dart';
import 'package:tracker/models/category/category_model.dart';
import 'package:tracker/screens/category_screens/expense_screen.dart';
import 'package:tracker/screens/category_screens/income_screen.dart';
import '../../consts/color.dart';
import '../../consts/container_shadow.dart';
import '../../widgets/appBar/appbar.dart';
import '../../consts/toast.dart';

ValueNotifier<CategoryType> selectedCategoryType =
    ValueNotifier(CategoryType.income);

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({super.key});

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final categoryNameController = TextEditingController();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    CategoryDB().refreshUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backBlack,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          //AppBar
          child: WidgetAppBar(title: 'Category')),
      body: Column(
        children: [
          TabBar(
              // enableFeedback: false,
              // automaticIndicatorColorAdjustment: false,

              indicatorColor: const Color.fromARGB(255, 206, 164, 52),
              labelStyle: const TextStyle(fontSize: 20),
              unselectedLabelStyle: const TextStyle(fontSize: 15),
              labelColor: gradGreen,
              unselectedLabelColor: gradBlue,
              controller: tabController,
              tabs: const [
                Tab(
                  text: 'Income',
                ),
                Tab(
                  text: 'Expense',
                )
              ]),
          Expanded(
            child: TabBarView(
                controller: tabController,
                children: const [ScreenIncome(), ScreenExpense()]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: gradGreen,
          onPressed: () {
            showBottumSheetMain(context);
          },
          child: const Icon(
            Icons.add,
            color: gradBlue,
          )),
    );
  }

  Future<void> showBottumSheetMain(BuildContext ctx) async {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      context: ctx,
      backgroundColor: backBlack,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // Radio(
                  //     fillColor: MaterialStateColor.resolveWith(
                  //       (states) => const Color.fromARGB(255, 206, 164, 52),
                  //     ),
                  //     value: null,
                  //     groupValue: null,
                  //     onChanged: (null)),
                  // const Text(
                  //   'Income',
                  //   style: TextStyle(
                  //       color: Color.fromARGB(255, 206, 164, 52), fontSize: 18),
                  // ),
                  // const SizedBox(
                  //   width: 20,
                  // ),
                  // Radio(
                  //     fillColor: MaterialStateColor.resolveWith(
                  //       (states) => const Color.fromARGB(255, 206, 164, 52),
                  //     ),
                  //     value: null,
                  //     groupValue: 1,
                  //     onChanged: (null)),
                  // const Text(
                  //   'Expense',
                  //   style: TextStyle(
                  //       color: Color.fromARGB(255, 206, 164, 52), fontSize: 18),
                  // )
                  RadioButtonWidget(title: 'Income', type: CategoryType.income),
                  RadioButtonWidget(
                      title: 'Expense', type: CategoryType.expense)
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: blueGreenGrad,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [containerShadow()]),
                  child: TextFormField(
                    controller: categoryNameController,
                    decoration: const InputDecoration(border: InputBorder.none),
                    textAlign: TextAlign.center,
                    // style:
                    //     const TextStyle(color: Color.fromARGB(255, 206, 164, 52)),
                    // decoration: InputDecoration(
                    //   hintText: 'Type here',
                    //   hintStyle: const TextStyle(
                    //       color: Color.fromARGB(255, 114, 95, 41)),
                    //   label: const Text(
                    //     'Category',
                    //     style:
                    //         TextStyle(color: Color.fromARGB(255, 206, 164, 52)),
                    //   ),
                    //   focusedBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(15.0),
                    //     borderSide: const BorderSide(
                    //         color: Color.fromARGB(255, 206, 164, 52), width: 2),
                    //   ),
                    //   enabledBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(15.0),
                    //     borderSide: const BorderSide(
                    //       color: Color.fromARGB(255, 206, 164, 52),
                    //       width: 2.0,
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: gradGreen),
                    onPressed: () async {
                      final categoryName = categoryNameController.text;
                      final categoryCap = categoryName.substring(0,1).toUpperCase()+categoryName.substring(1);
                      if (categoryCap.isEmpty) {
                        return;
                      }
                      final type = selectedCategoryType.value;
                      final category = CategoryModel(
                        id: DateTime.now().microsecondsSinceEpoch.toString(),
                        name: categoryCap,
                        type: type,
                      );
                      await CategoryDB.instance.insertCategory(category);
                      showToast(message: 'Added');
                      Navigator.of(context).pop();
                    },
                    child:
                        const Text('Done', style: TextStyle(color: backBlack))),
              )
            ],
          ),
        );
      },
    );
  }
}

class RadioButtonWidget extends StatelessWidget {
  final String title;
  final CategoryType type;
  const RadioButtonWidget({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: selectedCategoryType,
          builder: (context, newCategory, _) {
            return Radio<CategoryType>(
              fillColor: MaterialStateColor.resolveWith(
                (states) => greyWhite,
              ),
              value: type,
              groupValue: newCategory,
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                selectedCategoryType.value = value;
                selectedCategoryType.notifyListeners();
              },
            );
          },
        ),
        Text(
          title,
          style: const TextStyle(color: greyWhite, fontSize: 18),
        )
      ],
    );
  }
}
//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, 41, 72)
//font = Inter
