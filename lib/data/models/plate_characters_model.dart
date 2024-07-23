class PlateCharacterModel {
  String name;
  String governorateId;
  String governorateName;
  String id;
  DateTime creationDate;
  bool deleted;

  PlateCharacterModel({
    required this.name,
    required this.governorateId,
    required this.governorateName,
    required this.id,
    required this.creationDate,
    required this.deleted,
  });

  factory PlateCharacterModel.fromJson(Map<String, dynamic> json) {
    return PlateCharacterModel(
      name: json['name'],
      governorateId: json['governorateId'],
      governorateName: json['governorateName'],
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
    );
  }
}
