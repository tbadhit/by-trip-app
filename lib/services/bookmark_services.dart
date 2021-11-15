part of 'services.dart';

class BookmarkServices {
  static Future<ApiReturnValue<Wisata>> addWisataToBookmark(
      Wisata wisata) async {
    final db = await BookmarksDatabase.instance.database;
    final id = await db.insert(tableBookmarks, wisata.toJsonSqlite());
    return ApiReturnValue(value: wisata.copy(id: id));
  }

  static Future<ApiReturnValue<List<Wisata>?>> readAllBookmarks(
      User user) async {
    final db = await BookmarksDatabase.instance.database;
    const orderBy = '${BookmarkFields.time} ASC';
    final result = await db.query(tableBookmarks, orderBy: orderBy);
    List<Wisata>? finalResult =
        result.map((json) => Wisata.fromJsonSqlite(json)).toList();
    return ApiReturnValue(
        value: finalResult
            .where((element) => (user.city == "Makassar")
                ? element.city == "Makassar"
                : (user.city == "Tulungagung")
                    ? element.city == "Tulungagung"
                    : (user.city == "Banyumas")
                        ? element.city == "Banyumas"
                        : element.city == "Makassar")
            .toList());
  }

  static Future<ApiReturnValue<int>> removeBookmark(int id) async {
    final db = await BookmarksDatabase.instance.database;

    final delete = await db.delete(tableBookmarks,
        where: '${BookmarkFields.id} = ?', whereArgs: [id]);

    return ApiReturnValue(value: delete);
  }
}
