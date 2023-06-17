import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              height: size.height * 0.40,
              width: size.width * 0.40,
              child: const FlutterLogo(),
            ),

            ElevatedButton(
              child: const Text("Continue"),
              onPressed: () => Navigator.pushNamed(context, '/dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
