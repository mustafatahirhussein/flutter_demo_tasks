import 'dart:io';

import 'package:flutter_useful_tasks/sqflite/database/db_literals.dart';
import 'package:flutter_useful_tasks/sqflite/model/books_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbConfig {
  static final DbConfig dbConfig = DbConfig._();

  factory DbConfig() => dbConfig;

  DbConfig._();

  static Database? db;

  Future<Database> get dbInstance async {
    if (db != null) {
      return db!;
    }
    db = await onInit();
    return db!;
  }

  onInit() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, dbTitle);

    var initDatabase = await openDatabase(dbPath, onCreate: onCreate, version: dbVersion);
    return initDatabase;
  }

  onCreate(Database database, int version) async {
    await database.execute("""
    CREATE TABLE $table($booKId INTEGER PRIMARY KEY AUTOINCREMENT, $bookTitle TEXT, $bookAuthor TEXT, $bookPublishYear TEXT)
    """);
  }

  /* CRUD */
  Future<BooksModel> addBook(BooksModel booksModel) async {
    Database? database = await dbInstance;
    booksModel.bookId = await database.insert(table, booksModel.toMap());
    return booksModel;
  }

  Future<int> updateBook(BooksModel booksModel) async {
    Database? database = await dbInstance;
    return database.update(
      table,
      booksModel.toMap(),
      where: '$booKId = ?',
      whereArgs: [booksModel.bookId],
    );
  }

  Future<int> deleteBook(int id) async {
    Database? database = await dbInstance;
    return database.delete(table, where: '$booKId = ?', whereArgs: [id]);
  }

  Stream<List<BooksModel>> retrieveBooks() async* {
    Database? database = await dbInstance;

    List<Map> map = await database.query(table);
    List<BooksModel> bookList = [];

    for (int i = 0; i < map.length; i++) {
      bookList.add(BooksModel.fromMap(map[i]));
    }
    yield bookList;
  }
}
