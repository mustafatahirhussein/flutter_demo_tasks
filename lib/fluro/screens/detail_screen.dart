import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.data,});

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("PRODUCT DETAIL\n", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),),

            Text(data['item']!, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),),
            Text("Lorem Ipsum"),

          ],
        ),
      ),
    );
  }
}
