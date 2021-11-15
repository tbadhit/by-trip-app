part of 'models.dart';

class User extends Equatable {
  final int? id;
  final String name;
  final String email;
  final String phone;
  final String city;

  const User(
      {this.id,
      required this.name,
      required this.email,
      this.phone = '',
      required this.city});

  factory User.fromJson(Map<String, dynamic> data) => User(
      id: data["id"],
      name: data["name"],
      email: data["email"],
      phone: data["phone"] ?? "",
      city: data["city"]);

  @override
  List<Object?> get props => [id, name, phone, city, email];
}
