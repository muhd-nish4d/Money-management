import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Color.fromARGB(255, 14, 31, 51),
      fontSize: 16,
      textColor: Color.fromARGB(255, 206, 164, 52),
      timeInSecForIosWeb: 2);
}
void showSnackBarr(BuildContext context){
var snackbar = SnackBar(content: Text('Items are required'));
ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, 41, 72)
//font = Inter