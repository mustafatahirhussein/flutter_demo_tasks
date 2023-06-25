import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_useful_tasks/sqflite/database/db_config.dart';
import 'package:flutter_useful_tasks/sqflite/model/books_model.dart';
import 'package:flutter_useful_tasks/sqflite/presentation/widgets/books_custom_widget.dart';

class BookListing extends StatefulWidget {
  const BookListing({super.key});

  @override
  State<BookListing> createState() => _BookListingState();
}

class _BookListingState extends State<BookListing> {
  final DbConfig config = DbConfig();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffededed),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Books"),
      ),
      body: StreamBuilder<List<BooksModel>>(
        key: Key('${Random().nextDouble()}'),
        stream: config.retrieveBooks(),
        builder: (context, bookSp) {
          if (bookSp.hasData) {
            return bookSp.data!.isEmpty
                ? Center(
                    child: Text(
                      "No Books",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: bookSp.data!.length,
                    itemBuilder: (context, i) {
                      BooksModel item = bookSp.data![i];

                      return Dismissible(
                          key: UniqueKey(),
                          child: BookCustomWidget(model: item),
                          onDismissed: (direction) {
                            setState(() {
                              config.deleteBook(item.bookId!);
                            });
                          });
                    },
                  );
          }

          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.book),
          label: Text("Add New"),
          onPressed: () async {
            var data = await Navigator.of(context).pushNamed('/add_book');

            if (data != null) {
              setState(() {
                config.retrieveBooks();
              });
            }
          }),
    );
  }
}
