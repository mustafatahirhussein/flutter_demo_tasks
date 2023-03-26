import 'package:flutter/material.dart';
import 'package:flutter_useful_tasks/tasks/dynamic_formfields.dart';
import 'package:flutter_useful_tasks/tasks/flutter_best_practices.dart';
import 'package:flutter_useful_tasks/widgets/custom_text.dart';

class AppRouter {

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const FlutterBestPractices());

      case '/dynamic':
        return MaterialPageRoute(builder: (_) => const DynamicFormFields());

      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(
            child: CustomText(text: 'No route found'),
          ),
        ));
    }
  }
}