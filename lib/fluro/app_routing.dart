import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_useful_tasks/fluro/screens/dashboard_screen.dart';
import 'package:flutter_useful_tasks/fluro/screens/detail_screen.dart';
import 'package:flutter_useful_tasks/fluro/screens/initial.dart';
import 'package:flutter_useful_tasks/fluro/screens/profile_screen.dart';
import 'package:flutter_useful_tasks/sqflite/presentation/add_book.dart';
import 'package:flutter_useful_tasks/sqflite/presentation/book_listing.dart';

import '../tasks/pickers.dart';

class AppRouting {
  static final FluroRouter router = FluroRouter();

  var initialScreen = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) => InitialScreen(),
  );

  var dashboardScreen = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) => DashboardScreen(),
  );

  var pickerHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) => PickersDemo(),
  );

  var detailScreen = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) {

      var param = ModalRoute.of(context!)!.settings.arguments as Map<String, String>;
      return DetailScreen(data: param);
    }
  );

  var profileScreen = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) => ProfileScreen(),
  );

  var bookScreen = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) => BookListing(),
  );

  var addBookScreen = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params) => AddBook(),
  );

  dynamic initRoutes() {
    router.define('/', handler: initialScreen, transitionType: TransitionType.fadeIn);
    router.define('/dashboard', handler: dashboardScreen);
    router.define('/detail', handler: detailScreen);
    router.define('/profile', handler: profileScreen);


    router.define('/book_listing', handler: bookScreen);
    router.define('/add_book', handler: addBookScreen);
    router.define('/pickers', handler: pickerHandler);
  }
}