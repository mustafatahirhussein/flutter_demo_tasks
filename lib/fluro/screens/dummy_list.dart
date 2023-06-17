import 'package:flutter/material.dart';

class DummyList extends StatelessWidget {
  const DummyList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            '/detail',
            arguments: {'item': 'Dummy Product - ${i + 1}'},
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.withOpacity(0.2),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                ),
                SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dummy Product - ${i + 1}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text("Lorem Ipsum - product info"),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
