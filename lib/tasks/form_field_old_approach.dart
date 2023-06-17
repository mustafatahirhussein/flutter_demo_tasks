import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_useful_tasks/widgets/custom_formfield.dart';

class OldApprochFormField extends StatelessWidget {
  const OldApprochFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        CustomFormField.rounded(
          textAlign: TextAlign.center,
          maxLines: 4,
          inputType: TextInputType.number,
          inputAction: TextInputAction.next,
          formatters: [
            LengthLimitingTextInputFormatter(6),
          ],
        ),

        CustomFormField.rounded(
          textAlign: TextAlign.center,
          maxLines: 4,
          inputType: TextInputType.emailAddress,
          inputAction: TextInputAction.next,
        ),

      ],
    );
  }
}
