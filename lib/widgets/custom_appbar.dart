import 'package:flutter/material.dart';

class CustomAppbar extends AppBar {

  CustomAppbar.custom({
    super.key,
    String? title,
  }) : super(title: Text(title!));
}
