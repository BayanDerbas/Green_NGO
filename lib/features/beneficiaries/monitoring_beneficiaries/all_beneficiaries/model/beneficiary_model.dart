String formatDate(String rawDate) {
  if (rawDate.isEmpty) return "";
  final date = DateTime.parse(rawDate);
  return "${date.day}/${date.month}/${date.year}";
}

class BeneficiaryModel {
  final int id;
  final int userId;
  final String gender;
  final String dateOfBirth;
  final int age;
  final String region;
  final String address;
  final String maritalStatus;
  final int familySize;
  final String educationLevel;
  final double incomeBefore;
  final double incomeAfter;
  final String employmentStatus;
  final String nationalId;
  final String createdAt;
  final String updatedAt;
  final UserModel? user;

  BeneficiaryModel({
    required this.id,
    required this.userId,
    required this.gender,
    required this.dateOfBirth,
    required this.age,
    required this.region,
    required this.address,
    required this.maritalStatus,
    required this.familySize,
    required this.educationLevel,
    required this.incomeBefore,
    required this.incomeAfter,
    required this.employmentStatus,
    required this.nationalId,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory BeneficiaryModel.fromJson(Map<String, dynamic> json) {
    return BeneficiaryModel(
      id: json['id'],
      userId: json['user_id'],
      gender: json['gender'] ?? "",
      dateOfBirth: formatDate(json['date_of_birth'] ?? ""),
      age: json['age'] ?? 0,
      region: json['region'] ?? "",
      address: json['address'] ?? "",
      maritalStatus: json['marital_status'] ?? "",
      familySize: json['family_size'] ?? 0,
      educationLevel: json['education_level'] ?? "",
      incomeBefore: (json['income_before'] ?? 0).toDouble(),
      incomeAfter: (json['income_after'] ?? 0).toDouble(),
      employmentStatus: json['employment_status'] ?? "",
      nationalId: json['national_id'] ?? "",
      createdAt: formatDate(json['created_at'] ?? ""),
      updatedAt: formatDate(json['updated_at'] ?? ""),
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }
}

class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String status;
  final String email;
  final String created_at;
  final String updatet_at;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.status,
    required this.created_at,
    required this.updatet_at,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? "",
      lastName: json['last_name'] ?? "",
      phone: json['phone'] ?? "",
      status: json['status'] ?? "",
      created_at: json['created_at'] ?? "",
      updatet_at: json['updated_at'] ?? "",
      email: json['email'] ?? "",
    );
  }

  String get fullName => "$firstName $lastName";
}
