import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsig_flutter/constants/fonts.dart';

class ResponsiveTextStyle {
  final double context;

  ResponsiveTextStyle(BuildContext context)
      : context = MediaQuery.of(context).textScaleFactor * // Text scale factor
            MediaQuery.of(context).size.width /
            414; // Screen scale factor where 414 is the base screen so for screensizes of 414 the font size will be exact 1

  TextStyle getCustomTextStyle({
    String font = fontFamily,
    double height = 1,
    double fontSize = 22,
    FontStyle fontStyle = FontStyle.normal,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
    double letterSpacing = 0.0,
    textStyle = const TextStyle(),
  }) {
    return GoogleFonts.getFont(font,
        fontSize: fontSize * context, // Apply the combined scale factor here
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        height: height,
        color: color,
        letterSpacing: letterSpacing,
        textStyle: textStyle);
  }
}
