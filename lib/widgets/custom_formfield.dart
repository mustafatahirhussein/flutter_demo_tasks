import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends TextFormField {
  CustomFormField.rounded({
    super.key,
    TextEditingController? controller,
    String? hintText,
    ValueChanged<String>? onChanged,
    VoidCallback? onTap,
    bool readOnly = false,
    List<TextInputFormatter>? formatters,
    TextAlign? textAlign,
    TextInputType? inputType,
    TextInputAction? inputAction,
    int? maxLines,
  })  : assert(controller != null, "Controller is a required entity"),
        super(
          controller: controller,
          readOnly: readOnly,
          keyboardType: inputType,
          maxLines: maxLines,
          textInputAction: inputAction,
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
          inputFormatters: formatters,
          textAlign: textAlign ?? TextAlign.start,
          onChanged: onChanged,
          onTap: onTap,
        );
}
