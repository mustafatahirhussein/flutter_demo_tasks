import 'package:flutter/material.dart';
import 'package:flutter_useful_tasks/extensions/demo_extensions.dart';
import 'package:flutter_useful_tasks/widgets/custom_appbar.dart';
import 'package:flutter_useful_tasks/widgets/custom_formfield.dart';
import 'package:intl/intl.dart';

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
      locale: Locale('ur'),
      firstDate: DateTime(1980),
      lastDate: DateTime(2030),
      initialDatePickerMode: DatePickerMode.day,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.black, // Date indicator
              onPrimary: Colors.white, // Text Color
              surface: Colors.black, // Top Color
              onSurface: Colors.white, // Top Text Color
            ),
            dialogBackgroundColor: Colors.blue[800],
          ),
          child: child!,
        );
      },
    );

    if (date != null) {

      setState(() {
        _datePickerController.text = date.formattedDate;
      });
    }
  }

  dynamic timePickerDialog(BuildContext context) async {
    var time = await showTimePicker(context: context, initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.white, // Date indicator
              onPrimary: Colors.white, // Text Color
              surface: Colors.black, // Top Color
              onSurface: Colors.white, // Top Text Color
            ),
            dialogBackgroundColor: Colors.blue[800],
          ),
          child: child!,
        );
      },
    );

    if (time != null) {
      setState(() {
        _timePickerController.text = time.format(context);
      });
    }
  }
}
