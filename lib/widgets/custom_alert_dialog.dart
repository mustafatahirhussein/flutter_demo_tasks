import 'package:flutter/material.dart';

class CustomAlertDialog extends AlertDialog {
  CustomAlertDialog({
    String? title,
    List<Widget>? actions,
    Widget? content,
}) : super(
    title: Text(title!),
    titlePadding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
    alignment: Alignment.center,
    elevation: 3,
    actions: actions ?? [],
    content: content,
  );
}