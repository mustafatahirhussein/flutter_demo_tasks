import 'package:flutter/material.dart';
import 'package:flutter_useful_tasks/widgets/custom_text.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(text: text),
    );
  }
}
