import 'package:flutter/material.dart';

class CustomFormField extends TextFormField {
  CustomFormField.rounded({
    super.key,
    TextEditingController? controller,
    String? hintText,
    ValueChanged<String>? onChanged,
    VoidCallback? onTap,
    bool readOnly = false,
  })  : assert(controller != null, "Controller is a required entity"),
        super(
          controller: controller,
          readOnly: readOnly,
          decoration: InputDecoration(
            hintText: hintText,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onChanged: onChanged,
          onTap: onTap,
        );
}
