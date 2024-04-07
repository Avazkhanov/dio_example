class UserModel {
  final String uuid;
  final String firstName;
  final String lastName;
  final String birthDate;
  final int age;
  final String profileImage;

  UserModel({
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.age,
    required this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uuid: json['_uuid'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      birthDate: json['birth_date'],
      age: json['age'],
      profileImage: json['profile_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'birth_date': birthDate,
      'age': age,
      'profile_image': profileImage,
    };
  }

  Map<String, dynamic> toJsonForUpdate(){
    return {
      "_uuid" : uuid,
      'first_name': firstName,
      'last_name': lastName,
      'birth_date': birthDate,
      'age': age,
      'profile_image': profileImage,
    };
  }

  UserModel copyWith({
    String? uuid,
    String? firstName,
    String? lastName,
    String? birthDate,
    int? age,
    String? profileImage,
  }) {
    return UserModel(
      uuid: uuid ?? this.uuid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthDate: birthDate ?? this.birthDate,
      age: age ?? this.age,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
