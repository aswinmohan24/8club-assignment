import 'package:flutter/widgets.dart';

class AppColors {
  // surface
  static const baseColor = Color(0xFF101010);
  static const progressBg = Color(0xFF2E2E2E);

  static const white1 = Color(0x05FFFFFF);

  static const white2 = Color(0X0DFFFFFF);
  static const white = Color(0xFFFFFFFF);

  // color
  static const purple = Color(0xFF9196FF);
  static const purpleDark = Color(0xFF5961FF);

  // border
  static const borderLevel2 = Color(0x29FFFFFF);
  static const borderLevel1 = Color(0x14FFFFFF);

  // text
  static const text5 = Color(0x29FFFFFF);
  static const text1 = Color(0xFFFFFFFF);
  static const text3 = Color(0X7AFFFFFF);

  // gradients
  static const Color darkGray = Color(0x66222222);
  static const Color midGray = Color(0x66999999);
  static RadialGradient get backgroundGradient => const RadialGradient(
    center: Alignment(-1.0, -0.75), // translates Figma's 0% x, 8% y position
    radius: 6, // adjusts spread similar to 96% x 295% y
    colors: [darkGray, midGray, darkGray],
    stops: [0.0, 0.5, 1.0],
  );

  static RadialGradient get micbackgroundGradient => const RadialGradient(
    center: Alignment(-1.0, -0.75), // translates Figma's 0% x, 8% y position
    radius: 6, // adjusts spread similar to 96% x 295% y
    colors: [darkGray, midGray, darkGray],
    stops: [0.0, 0.2, 0.8],
  );

  // Gradient Border (linear)
  static const LinearGradient borderGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,

    colors: [
      Color(0x80FFFFFF),
      Color(0x80FFFFFF),

      Color(0x80101010), // rgba(16,16,16,0.5)
      // rgba(255,255,255,0.5)
    ],
  );
}
