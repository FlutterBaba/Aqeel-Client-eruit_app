class ProfileModel {
  final String firstName;
  final String lastName;
  final String userName;
  final String profilePic;
  final String email;
  final String language;
  final String phone;

  ProfileModel({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.profilePic,
    required this.email,
    required this.language,
    required this.phone,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      firstName: json['FirstName'],
      lastName: json['LastName'],
      userName: json['UserName'],
      profilePic: json['ProfilePic'],
      email: json['EmailId'],
      language: json['Language'],
      phone: json['Phone'],
    );
  }
}
