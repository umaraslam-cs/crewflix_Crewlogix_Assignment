import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Constant/AppConfig.dart';
import 'Theme/colors.dart';

void showLoadingIndicator(
    {required BuildContext context, bool isDark = false}) {
  showDialog(
    barrierDismissible: false,
    useRootNavigator: false,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppConfig(context).width / 2 - 30),
        child: Dialog(
          insetPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            height: 50,
            color: Colors.white,
            width: 50,
            child: const SpinKitThreeBounce(
              size: 22,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      );
    },
  );
}

void hideLoadingIndicator({
  required BuildContext context,
}) {
  Navigator.of(context).pop();
}
