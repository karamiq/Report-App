class VehicleFee {
  final int number;
  final String plateNumber;
  final String plateTypeId;
  final String plateCharacter;
  final DateTime creationDate;
  final String governorate;
  final List<String> images;
  final String violationLocation;

  VehicleFee({
    required this.number,
    required this.plateNumber,
    required this.plateTypeId,
    required this.plateCharacter,
    required this.creationDate,
    required this.governorate,
    required this.images,
    required this.violationLocation,
  });

  // You can add methods here if needed, like toJson(), fromJson(), etc.
}
