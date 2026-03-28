class ProgramCreateModel {
  final String name;
  final String description;
  final String type;
  final int targetAgeMin;
  final int targetAgeMax;
  final String targetGender;
  final String location;
  final double totalBudgetUsd;
  final double spentBudgetUsd;
  final String status;
  final String startDate;
  final String endDate;
  final int projectId;
  final int programManagerId;

  ProgramCreateModel({
    required this.name,
    required this.description,
    required this.type,
    required this.targetAgeMin,
    required this.targetAgeMax,
    required this.targetGender,
    required this.location,
    required this.totalBudgetUsd,
    required this.spentBudgetUsd,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.projectId,
    required this.programManagerId,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "type": type,
      "target_age_min": targetAgeMin,
      "target_age_max": targetAgeMax,
      "target_gender": targetGender,
      "location": location,
      "total_budget_usd": totalBudgetUsd,
      "spent_budget_usd": spentBudgetUsd,
      "status": status,
      "start_date": startDate,
      "end_date": endDate,
      "project_id": projectId,
      "program_manager_id": programManagerId,
    };
  }
}