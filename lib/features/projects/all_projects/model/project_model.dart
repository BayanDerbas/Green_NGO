class ProjectModel {
  final int? id;
  final String? name;
  final String? description;
  final String? location;
  final double? totalBudgetUsd;
  final String? status;
  final String? startDate;
  final String? endDate;

  ProjectModel({
    this.id,
    this.name,
    this.description,
    this.location,
    this.totalBudgetUsd,
    this.status,
    this.startDate,
    this.endDate,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      totalBudgetUsd: (json['total_budget_usd'] as num?)?.toDouble(),
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
      "location": location,
      "total_budget_usd": totalBudgetUsd,
      "status": status,
      "start_date": startDate,
      "end_date": endDate,
    };
  }
}