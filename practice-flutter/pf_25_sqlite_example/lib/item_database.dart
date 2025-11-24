import 'package:sqflite/sqflite.dart';

/// Simple SQLite helper for managing a single `items` table.
///
/// This class hides all low-level sqflite calls behind
/// easy-to-read methods (init, getItems, create, update, delete).
class ItemDatabase {
  /// Singleton instance of the opened database.
  static Database? _db;

  /// Initialize the database (if not already initialized).
  ///
  /// For this example we use an in-memory database so that
  /// the data is reset on every app restart. In a real app,
  /// you would typically use a file-based database path.
  static Future<void> init() async {
    if (_db != null) return;

    _db = await openDatabase(
      inMemoryDatabasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE items(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');
      },
    );
  }

  /// Read all rows from the `items` table, newest first.
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = _ensureDb();
    return db.query('items', orderBy: 'id DESC');
  }

  /// Insert a new item with the given name.
  static Future<int> createItem(String name) async {
    final db = _ensureDb();
    return db.insert('items', {'name': name.trim()});
  }

  /// Update an existing item by id.
  static Future<int> updateItem(int id, String name) async {
    final db = _ensureDb();
    return db.update(
      'items',
      {'name': name.trim()},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Delete an item by id.
  static Future<int> deleteItem(int id) async {
    final db = _ensureDb();
    return db.delete('items', where: 'id = ?', whereArgs: [id]);
  }

  /// Internal helper to ensure the database has been initialized.
  static Database _ensureDb() {
    final db = _db;
    if (db == null) {
      throw StateError('ItemDatabase.init() must be called before use');
    }
    return db;
  }
}
