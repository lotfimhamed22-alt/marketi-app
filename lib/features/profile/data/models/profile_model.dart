class UserModel {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String address;
  final String image;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      image: json['image'] ?? '',
    );
  }
}

class UserResponseModel {
  final UserModel user;

  UserResponseModel({required this.user});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(user: UserModel.fromJson(json['message']));
  }
}
