import 'package:flutter/material.dart';

class AppConfig {
  BuildContext context;
  double height = 30;
  double width = 50;

  AppConfig(this.context) {
    MediaQueryData queryData = MediaQuery.of(context);
    height = queryData.size.height;
    width = queryData.size.width;
  }
}
