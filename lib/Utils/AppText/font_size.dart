

import 'dart:math';

import 'package:flutter/material.dart';

double setFontSize({required double fontSize,required BuildContext context }) {
  final double sWidth = MediaQuery.of(context).size.width;
  final double sHeight = MediaQuery.of(context).size.height;
  final scaleH = sHeight /  MediaQuery.of(context).size.height;
  final scaleW = sWidth / MediaQuery.of(context).size.width;
  final double scale = max(scaleW, scaleH);
  final textScaleFactor = MediaQuery.of(context).textScaleFactor;

  return fontSize * scale * textScaleFactor;
}