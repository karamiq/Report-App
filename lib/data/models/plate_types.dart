class PlateTypeModel {
  String id;
  String? creationDate;
  bool deleted;
  String name;

  PlateTypeModel({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.name,
  });

  factory PlateTypeModel.fromJson(Map<String, dynamic> json) {
    return PlateTypeModel(
      id: json['id'],
      creationDate: json['creationDate'],
      deleted: json['deleted'],
      name: json['name'],
    );
  }
}
