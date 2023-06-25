import 'package:flutter/material.dart';
import 'package:flutter_useful_tasks/sqflite/database/db_config.dart';
import 'package:flutter_useful_tasks/sqflite/model/books_model.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {

  final TextEditingController _bookC = TextEditingController();
  final TextEditingController _bookAuthorC = TextEditingController();
  final TextEditingController _bookPublishC = TextEditingController();

  final DbConfig config = DbConfig();
  late int _id;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BooksModel? model = ModalRoute.of(context)!.settings.arguments as BooksModel?;

      if(model != null) {
        _bookC.text = model.bookTitle;
        _bookAuthorC.text = model.bookAuthor;
        _bookPublishC.text = model.bookPublishYear;
        _id = model.bookId!;
      }
      setState(() {});
    });
    _id = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_id == -1 ? "Add Book" : "Edit Book"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              children: [
                formField(_bookC, 'Book Title'),
                formField(_bookAuthorC, 'Book Author'),
                formField(_bookPublishC, 'Publishing Year'),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: _id == -1 ? () async {

                BooksModel model = BooksModel(
                  bookPublishYear: _bookPublishC.text,
                  bookAuthor: _bookAuthorC.text,
                  bookTitle: _bookC.text,
                );

                await config.addBook(model);
                Navigator.of(context).pop(true);

              } : () async {
                BooksModel model = BooksModel(
                  bookId: _id,
                  bookPublishYear: _bookPublishC.text,
                  bookAuthor: _bookAuthorC.text,
                  bookTitle: _bookC.text,
                );

                await config.updateBook(model);
                Navigator.of(context).pop(true);
              },
              child: Text(_id == -1 ? "Add Book" : "Edit Book"),
            ),
          ),
        ],
      ),
    );
  }

  Widget formField(TextEditingController controller, String hint) => Container(
    margin: EdgeInsets.symmetric(vertical: 9),
    child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: hint,
        ),
      ),
  );
}
