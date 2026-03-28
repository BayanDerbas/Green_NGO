class ProgramDetailsModel {
  int? id;
  String? name;
  String? description;
  String? type;
  int? targetAgeMin;
  int? targetAgeMax;
  String? targetGender;
  String? location;
  double? totalBudgetUsd;
  double? spentBudgetUsd;
  String? status;
  String? startDate;
  String? endDate;
  int? programManagerId;
  int? projectId;
  String? createdAt;
  String? updatedAt;

  ProgramDetailsModel(
      {this.id,
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
      this.programManagerId,
      this.projectId,
      this.createdAt,
      this.updatedAt});

  ProgramDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    targetAgeMin = json['target_age_min'];
    targetAgeMax = json['target_age_max'];
    targetGender = json['target_gender'];
    location = json['location'];
    totalBudgetUsd = json['total_budget_usd'];
    spentBudgetUsd = json['spent_budget_usd'];
    status = json['status'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    programManagerId = json['program_manager_id'];
    projectId = json['project_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['type'] = this.type;
    data['target_age_min'] = this.targetAgeMin;
    data['target_age_max'] = this.targetAgeMax;
    data['target_gender'] = this.targetGender;
    data['location'] = this.location;
    data['total_budget_usd'] = this.totalBudgetUsd;
    data['spent_budget_usd'] = this.spentBudgetUsd;
    data['status'] = this.status;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['program_manager_id'] = this.programManagerId;
    data['project_id'] = this.projectId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}