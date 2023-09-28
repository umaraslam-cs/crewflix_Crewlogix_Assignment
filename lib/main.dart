import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'App/Movies/Model/movies_model.dart';
import 'RoutesAndBindings/app_pages.dart';
import 'RoutesAndBindings/app_routes.dart';
import 'Utils/Theme/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(MoviesModelAdapter())
    ..registerAdapter(DetailAdapter())
    ..registerAdapter(VideoAdapter())
    ..registerAdapter(MovieImageAdapter())
    ..registerAdapter(CollectionAdapter())
    ..registerAdapter(VoteScoreAdapter())
    ..registerAdapter(FavMovieAdapter())
    ..registerAdapter(FeederAdapter());

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
