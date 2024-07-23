// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ViechleFee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViechleFee _$ViechleFeeFromJson(Map<String, dynamic> json) => ViechleFee(
      number: (json['number'] as num).toInt(),
      vehicleId: json['vehicleId'] as String,
      feeFinesId: json['feeFinesId'] as String,
      violationLocation: json['violationLocation'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      lat: json['lat'] as String,
      lng: json['lng'] as String,
      garageId: json['garageId'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      note: json['note'] as String,
    );

Map<String, dynamic> _$ViechleFeeToJson(ViechleFee instance) =>
    <String, dynamic>{
      'number': instance.number,
      'vehicleId': instance.vehicleId,
      'feeFinesId': instance.feeFinesId,
      'violationLocation': instance.violationLocation,
      'images': instance.images,
      'lat': instance.lat,
      'lng': instance.lng,
      'garageId': instance.garageId,
      'creationDate': instance.creationDate.toIso8601String(),
      'note': instance.note,
    };
