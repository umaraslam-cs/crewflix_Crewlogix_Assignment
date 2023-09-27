import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'RoutesAndBindings/app_pages.dart';
import 'RoutesAndBindings/app_routes.dart';
import 'Utils/Theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Crewflix',
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashView,
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  textScaleFactor:
                      mediaQueryData.textScaleFactor.clamp(0.9, 1.0)),
              child: child!),
        );
      },
      theme: ThemeData(
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: AppColor.primaryColor),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
