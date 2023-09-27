import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utils/Theme/colors.dart';
import '../ViewModel/splash_view_model.dart';
import 'components/splash_animation.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  final splashVM = Get.find<SplashViewModel>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.white,
      body: SizedBox.expand(child: SplashHorizontalAnimation()),
    );
  }
}
