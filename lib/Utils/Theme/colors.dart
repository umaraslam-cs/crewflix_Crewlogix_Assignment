import 'package:flutter/material.dart';

class AppColor {
  // appcolors._();
  static const Color transparent = Color(0xff000000);
  static const Color onboard = Color(0xff24E2B0);
  static const Color switchColor = Color(0xff6CDFB3);
  static const Color strokeGrey = Color(0xff343434);
// ! App BTN Colors
  static const Color userBTN = Color(0xff0EBE7E);
  static const Color doctorBTN = Color(0xff08A9E4);
  static const Color companyBTN = Color(0xffFF5050);
// ! App Colors
  static const Color border = Color(0xff856C3F);
  static const Color skyColor = Color(0xffF3F6F8);
  static const Color primaryColor = Color(0xFF3066ff);
  static const Color secondaryColor = Color(0xFFF9C924);
  static const Color textFieldBorder = Color(0xFF131313);
  static const Color sheetTopBar = Color(0xffc4c4c4);
  static const Color darkestBlack = Color(0xff272525);
// !Rendom Colors
  static const Color white = Color(0xFFffffff);
  static const Color black = Color(0xFF000000);
  static const Color green = Color(0xFF33cc66);
  static const Color orange = Color(0xFFF7931A);
  static const Color red = Color(0xFFFF3131);
// ! Text Colors
  static const Color darkText = Color(0xFF1D2733);
  static const Color greyText = Color(0xff5A5A5A);
  static const Color greyLightShade = Color(0xff6C727F);
  static const Color sky = Color(0xff111111);
  static const Color skyL = Color(0xFFF6F8FE);
  static const Color greyShade = Color(0xFF6C7581);
  static const Color greyText2 = Color(0xff97ADB6);
  static const Color greyText3 = Color(0xffE2E6E9);
  static const Color greyText4 = Color(0xff829EAA);
  static const Color greyText5 = Color(0xff605E5E);
  static const Color appBlue = Color(0xff005EAB);
  static const Color lightestGrey = Color(0xff4F4F4F);
  static const Color greyWhite = Color(0xffF3F6F8);

  // ! TextField Colors
  static const Color textFieldColor = Color(0xffF9F9FC);
}

class FontWeights {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
