import 'package:flutter/material.dart';

class EgyptMapTheme {
  final Color tooltipBackgroundColor;
  final Color tooltipStrokeColor;
  final double tooltipStrokeWidth;
  final Color borderColor;
  final double borderWidth;
  final TextStyle labelTextStyle;

  EgyptMapTheme({
    this.tooltipBackgroundColor = Colors.white,
    this.tooltipStrokeColor = const Color(0xfff1f2f4),
    this.tooltipStrokeWidth = 2.0,
    this.borderColor = const Color(0xfff1f2f4),
    this.borderWidth = 0.5,
    this.labelTextStyle = const TextStyle(
      color: Color(0xfff1f2f4),
      fontSize: 7,
    ),
  });
}