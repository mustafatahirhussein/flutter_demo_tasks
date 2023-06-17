import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_useful_tasks/fluro/screens/dummy_list.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final StreamController<int> _index = StreamController.broadcast();

  final List<Widget> list = [
    DummyList(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      initialData: 0,
      stream: _index.stream,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text("Items"),
            centerTitle: true,
          ),
          body: list[snapshot.data!],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'list'),
              BottomNavigationBarItem(icon: Icon(Icons.verified_user), label: 'profile'),
            ],
            onTap: (val) => _index.sink.add(val),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 30,
          ),
        );
      }
    );
  }
}
