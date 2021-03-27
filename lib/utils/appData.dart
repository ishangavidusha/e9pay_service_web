import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppData extends ChangeNotifier {
  Color mainBgColor = Color(0xFFFEC72E);
  Color mainTextColor = Color(0xFF765534);
  Color secTextColor = Color(0xFFC8CDE3);
  TextStyle mainTextStyle = GoogleFonts.poppins(
    color: Color(0xFF765534),
  );
  TextStyle secTextStyle = GoogleFonts.roboto(
    color: Color(0xFFC8CDE3),
  );

  LinearGradient linearGradientBt = LinearGradient(
    colors: [
      Color(0xFFE69707),
      Color(0xFFFED12E),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  List<BoxShadow> getBoxShadow(Color color) {
    return [BoxShadow(
      color: color.withOpacity(0.4),
      blurRadius: 16,
      spreadRadius: -6,
      offset: Offset(0, 18),
    )];
  }

  TextStyle getMainTextStyle() => mainTextStyle;
  TextStyle getSecTextStyle() => secTextStyle;
  Color getMainBgColor() => mainBgColor;
  LinearGradient getBtGradient() => linearGradientBt;
}