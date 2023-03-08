import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tracker/consts/color.dart';

void showToast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: gradBlue,
      fontSize: 16,
      textColor: backBlack,
      timeInSecForIosWeb: 2);
}

void showSnackBarr(BuildContext context) {
  var snackbar = const SnackBar(content: Text('Items are required'));
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}