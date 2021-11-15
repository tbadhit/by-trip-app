part of 'models.dart';

enum WisataType { semua, terkenal, rekomendasi }

const String tableBookmarks = 'bookmarks';

class Wisata extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final int? category;
  final WisataType? type;
  final int? price;
  final String? city;
  final String? province;
  final String? address;
  final String? open;
  final String? latitude;
  final String? longitude;
  final String? image;
  final DateTime? createdTime;

  Wisata({
    this.id,
    this.name,
    this.slug,
    this.category,
    this.type,
    this.price,
    this.city,
    this.province,
    this.address,
    this.open,
    this.latitude,
    this.longitude,
    this.image,
    required this.createdTime,
  });

  Wisata copy({
    int? id,
    String? name,
    String? slug,
    int? category,
    int? price,
    String? city,
    String? province,
    String? address,
    String? open,
    String? latitude,
    String? longitude,
    String? image,
    DateTime? createdTime,
  }) =>
      Wisata(
        id: id ?? this.id,
        createdTime: createdTime ?? this.createdTime,
        address: address ?? this.address,
        category: category ?? this.category,
        city: city ?? this.city,
        image: image ?? this.image,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        name: name ?? this.name,
        open: open ?? this.open,
        price: price ?? this.price,
        province: province ?? this.province,
        slug: slug ?? this.slug,
      );

  factory Wisata.fromJsonSqlServer(Map<String, dynamic> data) => Wisata(
        id: data["id"],
        name: data["nama_wisata"],
        slug: data["slug"],
        category: data["kategori_id"],
        price: data["harga"],
        city: data["kota"],
        province: data["provinsi"],
        address: data["alamat"],
        open: data["waktu_buka"],
        latitude: data["latitude"],
        longitude: data["longitude"],
        image: data["image"],
        createdTime: DateTime.now(),
      );

  static Wisata fromJsonSqlite(Map<String, dynamic> json) => Wisata(
      id: json[BookmarkFields.id] as int?,
      createdTime: DateTime.parse(json[BookmarkFields.time]),
      address: json[BookmarkFields.address] as String,
      category: json[BookmarkFields.category] as int,
      city: json[BookmarkFields.city] as String,
      image: json[BookmarkFields.image] as String,
      latitude: json[BookmarkFields.latitude] as String,
      longitude: json[BookmarkFields.longitude] as String,
      name: json[BookmarkFields.name] as String,
      open: json[BookmarkFields.open] as String,
      price: json[BookmarkFields.price] as int,
      province: json[BookmarkFields.province] as String,
      slug: json[BookmarkFields.slug] as String);

  Map<String, Object?> toJsonSqlite() => {
        BookmarkFields.id: id,
        BookmarkFields.name: name,
        BookmarkFields.slug: slug,
        BookmarkFields.category: category,
        BookmarkFields.price: price,
        BookmarkFields.city: city,
        BookmarkFields.province: province,
        BookmarkFields.address: address,
        BookmarkFields.open: open,
        BookmarkFields.latitude: latitude,
        BookmarkFields.longitude: longitude,
        BookmarkFields.image: image,
        BookmarkFields.time: createdTime!.toIso8601String()
      };

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        category,
        type,
        price,
        city,
        province,
        address,
        open,
        latitude,
        longitude,
        image,
        createdTime,
      ];
}
