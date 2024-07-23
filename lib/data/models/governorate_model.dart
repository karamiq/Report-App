class GovernorateModel {
  String id;
  DateTime creationDate;
  bool deleted;
  String name;

  GovernorateModel({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.name,
  });

  factory GovernorateModel.fromJson(Map<String, dynamic> json) {
    return GovernorateModel(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creationDate': creationDate.toIso8601String(),
      'deleted': deleted,
      'name': name,
    };
  }
}
