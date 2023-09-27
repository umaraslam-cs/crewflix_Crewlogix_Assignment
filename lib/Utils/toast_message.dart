import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Theme/colors.dart';

class ShowMessage {
  onSuccess(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: AppColor.primaryColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  onFail(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: AppColor.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
