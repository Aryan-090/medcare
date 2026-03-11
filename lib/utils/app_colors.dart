import 'package:flutter/material.dart';


class AppColors {
  static const MaterialColor appMaterialColor = Colors.blue;

  static const primary = Color(0xFF26408B);
  static const primaryDark = Color(0xFFB67632);
  static const primaryExtraDark = Color(0xFF6B240C);
  static const primaryLight = Color(0xFFFFD8A6);

  // Backgrounds
  static const background = Color(0xFFFFFFFF);
  static const scaffoldBackground = Color(0xFFF3F2F7);
  static const cardBackground = Color(0xFFF0F0F0);
  static const containerBackground = Color(0xFFDDDBE6);

  // Text Colors
  static const text = Color(0xFF000000);
  static const secondaryText = Color(0xFF4F4F4F);
  static const subText = Color(0xFF828282);
  static const disableText = Color(0xFFBDBDBD);
  static const whiteText = Color(0xFFFFFFFF);
  static const greyLight=Color(0xff939393);

  // Border & Divider
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFBDBDBD);
  static const Color containerBorder= Color(0xffEBEBEB);
  static const Color greyShade1= Color(0xffE5E5E5);
  static const Color greyContainer=Color(0xffF3F4F6);

  // States
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color secondarySuccess = Color(0xFF7ef083);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF0288D1);
  static const Color teal = Color(0xFF00897B);

  // Buttons
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = Color(0xFFE0E0E0);
  static const Color buttonText = whiteText;
  static const Color textInput = Color(0xFFBDBDBD);


  // Icon Colors
  static const Color transparent = Colors.transparent;
  static const Color disabledIcon = Color(0xFF9E9E9E);

  // Shadows
  static const Color shadow = Color(0x1F000000); // 12% opacity black

  // Custom Accent Colors (if needed)
  static const Color blue = Color(0xFF1E88E5);
  static const Color pink = Colors.pink;
  static const Color darkBlue = Color(0xFF1F59DA);
  static const Color green = Color(0xFF4CAF50);
  static const Color darkGreen = Color(0xFF066E21);
  static const Color red = error;
  static const Color amber = Colors.amber;
  static const purple = Color(0xFF4f49b9);
  static const orange = warning;
  static final grey = Colors.grey;
  static final black = Colors.black;
  static const white = Color(0xFFFFFFFF);

  // Toast Color
  static const toast = Color(0xFFE0DFDF);
}

extension ColorOpacityExtension on Color {
  Color primaryWithOpacity(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0, "Opacity must be between 0.0 and 1.0");
    return withAlpha((opacity * 255).round());
  }
}