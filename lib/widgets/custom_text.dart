import 'package:flutter/material.dart';

class CustomText extends Text {
  CustomText({
    super.key,
    String? text,
    Color? color,
    double? fontSize,
}) : assert(text != null, "Text is required"), super(text!, textAlign: TextAlign.center, style: TextStyle(
    color: color ?? Color(0xffffffff),
    fontSize: fontSize,
  ),);
}