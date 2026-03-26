class AddBeneficiaryRequest {
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

  AddBeneficiaryRequest({
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
  });

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "national_id": nationalId,
        "age": age,
        "region": region,
        "address": address,
        "marital_status": maritalStatus,
        "family_size": familySize,
        "education_level": educationLevel,
        "income_before": incomeBefore,
        "income_after": incomeAfter,
        "employment_status": employmentStatus,
      };
}