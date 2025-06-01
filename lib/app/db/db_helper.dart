// db/database_helper.dart
import 'package:daily_expense_monitor_app/app/db/models/transaction_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'transaction.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
  CREATE TABLE transactions(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    amount REAL,
    date TEXT
  )
''');
      },
    );
  }

  Future<int> insertTransaction(TransactionModel txn) async {
    final db = await database;
    return await db.insert('transactions', txn.toMap());
  }

  Future<List<TransactionModel>> getTransactions() async {
    final db = await database;
    final result = await db.query('transactions');
    return result.map((e) => TransactionModel.fromMap(e)).toList();
  }
}
