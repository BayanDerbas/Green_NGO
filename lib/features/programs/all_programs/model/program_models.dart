class ProgramModel {
  final int? id;
  final String? name;
  final String? description;
  final String? type;
  final int? targetAgeMin;
  final int? targetAgeMax;
  final String? targetGender;
  final String? location;
  final double? totalBudgetUsd;
  final double? spentBudgetUsd;
  final String? status;
  final String? startDate;
  final String? endDate;

  ProgramModel({
    this.id,
    this.name,
    this.description,
    this.type,
    this.targetAgeMin,
    this.targetAgeMax,
    this.targetGender,
    this.location,
    this.totalBudgetUsd,
    this.spentBudgetUsd,
    this.status,
    this.startDate,
    this.endDate,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) {
    return ProgramModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      type: json['type'],
      targetAgeMin: json['target_age_min'],
      targetAgeMax: json['target_age_max'],
      targetGender: json['target_gender'],
      location: json['location'],
      totalBudgetUsd: (json['total_budget_usd'] as num?)?.toDouble(),
      spentBudgetUsd: (json['spent_budget_usd'] as num?)?.toDouble(),
      status: json['status'],
      startDate: json['start_date'],
      endDate: json['end_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
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
    };
  }
}