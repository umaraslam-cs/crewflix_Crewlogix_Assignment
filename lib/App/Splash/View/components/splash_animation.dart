import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashHorizontalAnimation extends StatefulWidget {
  const SplashHorizontalAnimation({Key? key}) : super(key: key);

  @override
  _SplashHorizontalAnimationState createState() =>
      _SplashHorizontalAnimationState();
}

class _SplashHorizontalAnimationState extends State<SplashHorizontalAnimation>
    with SingleTickerProviderStateMixin {
  bool showSelectorBtn = false;

  AnimationController? controller;
  Animation<Offset>? offset;

  animationController() {
    controller!.forward();
    // Timer(Duration(microseconds: 500), () {
    //   setState(() {
    //     showSelectorBtn = true;
    //   });
    // });
  }

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    offset = Tween<Offset>(begin: const Offset(0.0, 1.0), end: (Offset.zero))
        .animate(controller!);
    // offset = Tween<Offset>(begin: Offset(-1, 0.0), end: Offset(0.06, 0.0))
    //     .animate(controller!);
    animationController();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: offset!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Image.asset("assets/logo/app_logo.png"),
      ),
    );
  }
}
