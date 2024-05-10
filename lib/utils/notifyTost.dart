import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void notifyTost(String massage) {
  Fluttertoast.showToast(
      msg: massage,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      textColor: Colors.white,
      backgroundColor: Colors.black45,
      fontSize: 18);
}
