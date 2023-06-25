class BooksModel {
  int? bookId;
  String bookTitle, bookAuthor, bookPublishYear;

  BooksModel({
    this.bookId,
    required this.bookPublishYear,
    required this.bookAuthor,
    required this.bookTitle,
  });

  factory BooksModel.fromMap(Map<dynamic, dynamic> json) => BooksModel(
    bookId: json['book_id'],
    bookTitle: json['book_title'],
    bookAuthor: json['book_author'],
    bookPublishYear: json['book_publish_year'],
  );

  dynamic toMap() => {
    'book_id': bookId,
    'book_title': bookTitle,
    'book_author': bookAuthor,
    'book_publish_year': bookPublishYear,
  };
}
