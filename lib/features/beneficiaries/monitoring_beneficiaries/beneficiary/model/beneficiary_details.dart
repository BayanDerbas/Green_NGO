class BeneficiaryDetails {
  final int userId;
  final int id;
  final String gender;
  final String dateOfBirth; 
  final String nationalId;
  final int age;
  final String region;
  final String address;
  final String maritalStatus;
  final int familySize;
  final String educationLevel;
  final double incomeBefore;
  final double incomeAfter;
  final String employmentStatus;
  final String createdAt;  
  final String updatedAt;  
  final UserDetails user;

  BeneficiaryDetails({
    required this.userId,
    required this.id,
    required this.gender,
    required this.dateOfBirth,
    required this.nationalId,
    required this.age,
    required this.region,
    required this.address,
    required this.maritalStatus,
    required this.familySize,
    required this.educationLevel,
    required this.incomeBefore,
    required this.incomeAfter,
    required this.employmentStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory BeneficiaryDetails.fromJson(Map<String, dynamic> json) {
    String formatDate(String dateTimeStr) {
      if (dateTimeStr.isEmpty) return "";
      DateTime dt = DateTime.parse(dateTimeStr);
      return "${dt.day}/${dt.month}/${dt.year}";
    }

    return BeneficiaryDetails(
      userId: json['user_id'] ?? 0,
      id: json['id'] ?? 0,
      gender: json['gender'] ?? "",
      dateOfBirth: formatDate(json['date_of_birth'] ?? ""),
      nationalId: json['national_id'] ?? "",
      age: json['age'] ?? 0,
      region: json['region'] ?? "",
      address: json['address'] ?? "",
      maritalStatus: json['marital_status'] ?? "",
      familySize: json['family_size'] ?? 0,
      educationLevel: json['education_level'] ?? "",
      incomeBefore: (json['income_before'] ?? 0).toDouble(),
      incomeAfter: (json['income_after'] ?? 0).toDouble(),
      employmentStatus: json['employment_status'] ?? "",
      createdAt: formatDate(json['created_at'] ?? ""),
      updatedAt: formatDate(json['updated_at'] ?? ""),
      user: UserDetails.fromJson(json['user'] ?? {}),
    );
  }
    Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'id': id,
      'gender': gender,
      'date_of_birth': dateOfBirth,
      'national_id': nationalId,
      'age': age,
      'region': region,
      'address': address,
      'marital_status': maritalStatus,
      'family_size': familySize,
      'education_level': educationLevel,
      'income_before': incomeBefore,
      'income_after': incomeAfter,
      'employment_status': employmentStatus,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'user': user.toJson(),
    };
  }
}

class UserDetails {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String emailVerifiedAt;
  final String phone;
  final String role;
  final String status;
  final String lastLoginAt;
  final String createdAt;  
  final String updatedAt;  

  UserDetails({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerifiedAt,
    required this.phone,
    required this.role,
    required this.status,
    required this.lastLoginAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    String formatDate(String dateTimeStr) {
      if (dateTimeStr.isEmpty || dateTimeStr == "null") return "";
      DateTime dt = DateTime.parse(dateTimeStr);
      return "${dt.day}/${dt.month}/${dt.year}";
    }

    return UserDetails(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? "",
      lastName: json['last_name'] ?? "",
      email: json['email'] ?? "",
      emailVerifiedAt: formatDate(json['email_verified_at'] ?? ""),
      phone: json['phone'] ?? "",
      role: json['role'] ?? "",
      status: json['status'] ?? "",
      lastLoginAt: json['last_login_at'] != null ? formatDate(json['last_login_at']) : "",
      createdAt: formatDate(json['created_at'] ?? ""),
      updatedAt: formatDate(json['updated_at'] ?? ""),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'phone': phone,
      'role': role,
      'status': status,
      'last_login_at': lastLoginAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  String get fullName => "$firstName $lastName";
}