import 'package:flutter/material.dart';
import 'package:flutter_useful_tasks/widgets/custom_text.dart';
import 'package:flutter_useful_tasks/widgets/custom_widget.dart';

class FlutterBestPractices extends StatefulWidget {
  const FlutterBestPractices({Key? key}) : super(key: key);

  @override
  State<FlutterBestPractices> createState() => _FlutterBestPracticesState();
}

class _FlutterBestPracticesState extends State<FlutterBestPractices> {
  /// Correct way
  TextEditingController _emailController = TextEditingController();
  String _defaultCurrency = 'Rs.';

  /// Wrong way
  TextEditingController emailController = TextEditingController();
  String defaultCurrency = 'Rs.';

  Future? _demoFuture;

  @override
  Widget build(BuildContext context) {
    String text = "Now using a Custom Widget";

    return Scaffold(
      body: Column(
        children: [
          CustomWidget(text: text),
          CustomWidget(text: text),

          FutureBuilder(
            future: _demoFuture,
            builder: (context, snapshot) => snapshot.hasData ? CustomWidget(text: "Success") : Container(),
          ),

          TextButton(onPressed: () {

            Navigator.pushNamed(context, '/dynamic');

          }, child: Text("Navigations"))
        ],
      ),
    );
  }
}
