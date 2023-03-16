import 'package:flutter/material.dart';
import 'package:flutter_useful_tasks/widgets/custom_appbar.dart';
import 'package:flutter_useful_tasks/widgets/custom_formfield.dart';

class PickersDemo extends StatefulWidget {
  const PickersDemo({Key? key}) : super(key: key);

  @override
  State<PickersDemo> createState() => _PickersDemoState();
}

class _PickersDemoState extends State<PickersDemo> {
  final TextEditingController _datePickerController = TextEditingController();
  final TextEditingController _timePickerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.custom(
        title: "Pickers Demo",
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          CustomFormField.rounded(
            controller: _datePickerController,
            hintText: "Tap to select Date",
            readOnly: true,
            onChanged: (val) {},
            onTap: () => datePickerDialog(context),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: CustomFormField.rounded(
              controller: _timePickerController,
              hintText: "Tap to select Time",
              readOnly: true,
              onChanged: (val) {},
              onTap: () => timePickerDialog(context),
            ),
          ),
        ],
      ),
    );
  }

  dynamic datePickerDialog(BuildContext context) async {
    var date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime(2030));

    if (date != null) {
      setState(() {
        _datePickerController.text = date.toString();
      });
    }
  }

  dynamic timePickerDialog(BuildContext context) async {
    var time = await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (time != null) {
      setState(() {
        _timePickerController.text = time.format(context);
      });
    }
  }
}
