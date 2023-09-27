import 'package:flutter/material.dart';

import 'font_type.dart';

class CustomText extends StatelessWidget {
  final String title;
  final TextAlign alignment;
  final TextOverflow txtOverFlow;
  final FontStyle style;
  final double letterSpacce;
  final Color color;
  final TextDecoration textDecoration;
  final FontWeight fontWeight;
  final double size;
  final double height;
  final FontType fontType;

  const CustomText({
    super.key,
    this.fontType = FontType.plusJakartaSans,
    this.size = 14,
    this.fontWeight = FontWeight.w400,
    this.textDecoration = TextDecoration.none,
    this.color = Colors.black,
    this.letterSpacce = 0,
    this.style = FontStyle.normal,
    this.alignment = TextAlign.start,
    this.txtOverFlow = TextOverflow.visible,
    this.height = 1.0,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alignment,
      style: TextStyle(
          overflow: txtOverFlow,
          fontStyle: style,
          letterSpacing: letterSpacce,
          color: color,
          decoration: textDecoration,
          fontWeight: fontWeight,
          fontSize: size,
          height: height),
    );
  }
}
