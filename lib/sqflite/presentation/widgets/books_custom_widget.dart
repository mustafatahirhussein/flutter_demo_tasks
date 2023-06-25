import 'package:flutter/material.dart';
import 'package:flutter_useful_tasks/sqflite/model/books_model.dart';

class BookCustomWidget extends StatelessWidget {
  const BookCustomWidget({
    super.key,
    required this.model,
  });

  final BooksModel model;

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.bold,
    );

    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/add_book', arguments: model),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          children: [
            CircleAvatar(
              child: Text(model.bookId.toString()),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: Text(model.bookTitle, style: style),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(model.bookAuthor),
                Text("Published: ${model.bookPublishYear}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
