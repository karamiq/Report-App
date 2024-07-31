class VehicleFee {
  final int number;
  final String plateNumber;
  final String plateCharacterId;
  final String plateTypeId;
  final String feeFinesId;
  final String garageId;
  final DateTime creationDate;
  final String governorateId;
  final List<String> images;
  final String note;
  final String lat;
  final String lng;
  final String violationLocation;

  // Constructor
  VehicleFee({
    required this.number,
    required this.plateNumber,
    required this.plateCharacterId,
    required this.plateTypeId,
    required this.feeFinesId,
    required this.garageId,
    required this.creationDate,
    required this.governorateId,
    required this.images,
    required this.note,
    required this.lat,
    required this.lng,
    required this.violationLocation,
  });

  // Factory method to create an instance from JSON
  factory VehicleFee.fromJson(Map<String, dynamic> json) {
    return VehicleFee(
      number: json['number'],
      plateNumber: json['plateNumber'],
      plateCharacterId: json['plateCharacterId'],
      plateTypeId: json['plateTypeId'],
      feeFinesId: json['feeFinesId'],
      garageId: json['garageId'],
      creationDate: DateTime.parse(json['creationDate']),
      governorateId: json['governorateId'],
      images: List<String>.from(json['images']),
      note: json['note'],
      lat: json['lat'],
      lng: json['lng'],
      violationLocation: json['violationLocation'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'plateNumber': plateNumber,
      'plateCharacterId': plateCharacterId,
      'plateTypeId': plateTypeId,
      'feeFinesId': feeFinesId,
      'garageId': garageId,
      'creationDate': creationDate.toIso8601String(),
      'governorateId': governorateId,
      'images': images,
      'note': note,
      'lat': lat,
      'lng': lng,
      'violationLocation': violationLocation,
    };
  }
}
