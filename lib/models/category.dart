part of 'models.dart';

class Category extends Equatable {
    final String id;
    final String name;
    final String slug;

  const Category({required this.id, required this.name, required this.slug});

  factory Category.fromJson(Map<String, dynamic> data) => Category(
    id: data["id"],
    name: data["nama_kategori"],
    slug: data["slug"]
  );

  @override
  List<Object?> get props => [id, name, slug];
}