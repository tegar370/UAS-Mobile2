import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String email;
  dynamic emailVerifiedAt;
  String role;
  dynamic photoProfileUrl;
  DateTime createdAt;
  DateTime updatedAt;
  Customer customer;

  User({
    required this.id,
    required this.email,
    required this.emailVerifiedAt,
    required this.role,
    required this.photoProfileUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.customer,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        role: json["role"],
        photoProfileUrl: json["photo_profile_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        customer: Customer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "role": role,
        "photo_profile_url": photoProfileUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "customer": customer.toJson(),
      };
}

class Customer {
  int id;
  int userId;
  String firstName;
  String lastName;
  String phoneNumber;
  String address;
  dynamic photoProfileUrl;
  DateTime createdAt;
  DateTime updatedAt;

  Customer({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.address,
    required this.photoProfileUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        address: json["address"],
        photoProfileUrl: json["photo_profile_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "address": address,
        "photo_profile_url": photoProfileUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
