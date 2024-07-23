import 'package:json_annotation/json_annotation.dart';

part 'ViechleFee.g.dart';

@JsonSerializable()
class ViechleFee {
  int number;
  String vehicleId;
  String feeFinesId;
  String violationLocation;
  List<String> images;
  String lat;
  String lng;
  String garageId;
  DateTime creationDate;
  String note;

  ViechleFee({
    required this.number,
    required this.vehicleId,
    required this.feeFinesId,
    required this.violationLocation,
    required this.images,
    required this.lat,
    required this.lng,
    required this.garageId,
    required this.creationDate,
    required this.note,
  });

  factory ViechleFee.fromJson(Map<String, dynamic> json) =>
      _$ViechleFeeFromJson(json);

  Map<String, dynamic> toJson() => _$ViechleFeeToJson(this);
}
