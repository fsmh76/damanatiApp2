class UserModel {
  String firstName;
  String lastName;
  String gender;
  String city;
  String bio;
  String profilePic;
  String createdAt;
  String phoneNumber;
  String uid;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.city,
    required this.bio,
    required this.profilePic,
    required this.createdAt,
    required this.phoneNumber,
    required this.uid,
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      gender: map['gender'] ?? '',
      city: map['city'] ?? '',
      bio: map['bio'] ?? '',
      uid: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      createdAt: map['createdAt'] ?? '',
      profilePic: map['profilePic'] ?? '',
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Gender": gender,
      "City": city,
       "bio": bio,
      "uid": uid,
      "profilePic": profilePic,
      "phoneNumber": phoneNumber,
      "createdAt": createdAt,
    };
  }
}
