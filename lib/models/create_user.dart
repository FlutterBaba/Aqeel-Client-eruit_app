class CreateUserModel {
  final String? id;
  final String userName;
  final String firstName;
  final String lastName;
  final String firmName;
  final String password;
  final String email;
  final String phone;
  final String? createdOn;
  CreateUserModel({
    this.id,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.firmName,
    required this.password,
    required this.email,
    required this.phone,
    this.createdOn,
  });

  factory CreateUserModel.fromJson(Map<String, dynamic> json) {
    return CreateUserModel(
      id: json['id'] ?? "",
      userName: json['userName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      firmName: json['firmName'],
      password: json['password'],
      email: json['email'],
      phone: json['phone'],
      createdOn: json['createdOn'] ?? "",
    );
  }
}
