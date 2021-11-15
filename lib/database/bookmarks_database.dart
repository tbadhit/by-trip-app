import 'package:by_trip/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BookmarksDatabase {
  static final BookmarksDatabase instance = BookmarksDatabase._init();

  static Database? _database;

  BookmarksDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('bookmarks.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const integerType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $tableBookmarks(
        ${BookmarkFields.id} $idType,
        ${BookmarkFields.name} $textType,
        ${BookmarkFields.slug} $textType,
        ${BookmarkFields.category} $integerType,
        ${BookmarkFields.price} $integerType,
        ${BookmarkFields.city} $textType,
        ${BookmarkFields.province} $textType,
        ${BookmarkFields.address} $textType,
        ${BookmarkFields.open} $textType,
        ${BookmarkFields.latitude} $textType,
        ${BookmarkFields.longitude} $textType,
        ${BookmarkFields.image} $textType,
        ${BookmarkFields.time} $textType
      )
    ''');
  }
}