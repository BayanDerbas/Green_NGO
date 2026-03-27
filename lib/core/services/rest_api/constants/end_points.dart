// ignore_for_file: constant_identifier_names, non_constant_identifier_names

abstract class EndPoints {
  //##########  Base Url  ##########
  static const String baseUrl = 'https://haidarah.dev/api';

  //SECTION - Auth
  static const login = "/auth/login";
  //SECTION - Beneficiaries
  static String all_beneficiaries(int page) => "/auth/beneficiaries?page=$page";
  //SECTION - Beneficiary Details
  static String beneficiary_details(int beneficiaryId) =>
      "/auth/beneficiaries/$beneficiaryId";
  //SECTION - Update Beneficiary
  static String update_beneficiary(int id) => "/auth/beneficiaries/$id";
  //SECTION - AllUsers
  static String all_users(int page) => "/auth/users?page=$page";
}
