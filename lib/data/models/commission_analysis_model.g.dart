// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission_analysis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommissionAnalysisModelImpl _$$CommissionAnalysisModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CommissionAnalysisModelImpl(
      violationCardAnalysis: (json['violationCardAnalysis'] as List<dynamic>)
          .map((e) => ViolationCardAnalysis.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberOfViolations: (json['numberOfViolations'] as num).toInt(),
      totalPrice: (json['totalPrice'] as num).toInt(),
      lastViolations: (json['lastViolations'] as List<dynamic>)
          .map((e) => LastViolation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CommissionAnalysisModelImplToJson(
        _$CommissionAnalysisModelImpl instance) =>
    <String, dynamic>{
      'violationCardAnalysis': instance.violationCardAnalysis,
      'numberOfViolations': instance.numberOfViolations,
      'totalPrice': instance.totalPrice,
      'lastViolations': instance.lastViolations,
    };

_$ViolationCardAnalysisImpl _$$ViolationCardAnalysisImplFromJson(
        Map<String, dynamic> json) =>
    _$ViolationCardAnalysisImpl(
      name: json['name'] as String,
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$$ViolationCardAnalysisImplToJson(
        _$ViolationCardAnalysisImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
    };

_$LastViolationImpl _$$LastViolationImplFromJson(Map<String, dynamic> json) =>
    _$LastViolationImpl(
      number: (json['number'] as num).toInt(),
      userId: json['userId'] as String,
      userFullName: json['userFullName'] as String,
      userGarageId: json['userGarageId'] as String,
      userGarageName: json['userGarageName'] as String?,
      garageGovernorateName: json['garageGovernorateName'] as String?,
      vehicleId: json['vehicleId'] as String,
      vehicleChassisNumber: json['vehicleChassisNumber'] as String,
      vehiclePlateCharacterId: json['vehiclePlateCharacterId'] as String,
      vehiclePlateCharacterName: json['vehiclePlateCharacterName'] as String,
      vehiclePlateType: json['vehiclePlateType'] as String?,
      vehicleGovernorateId: json['vehicleGovernorateId'] as String,
      vehicleGovernorateName: json['vehicleGovernorateName'] as String?,
      plateNumber: json['plateNumber'] as String,
      feeFines: FeeFines.fromJson(json['feeFines'] as Map<String, dynamic>),
      isPaid: json['isPaid'] as bool,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      duplicateCount: (json['duplicateCount'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      totalAmount: (json['totalAmount'] as num).toInt(),
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      invoiceNumber: (json['invoiceNumber'] as num).toInt(),
      violationPayReceiptId: json['violationPayReceiptId'] as String?,
      violationPayReceiptNumber: json['violationPayReceiptNumber'] as String?,
      garageId: json['garageId'] as String,
      garageName: json['garageName'] as String?,
      paymentGarageId: json['paymentGarageId'] as String?,
      paymentGarage: json['paymentGarage'] as String?,
      paymentReceiptNumber: json['paymentReceiptNumber'] as String?,
      paymentDate: json['paymentDate'] as String?,
      status: (json['status'] as num).toInt(),
      note: json['note'] as String?,
      id: json['id'] as String,
      creationDate: json['creationDate'] as String,
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$$LastViolationImplToJson(_$LastViolationImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'userId': instance.userId,
      'userFullName': instance.userFullName,
      'userGarageId': instance.userGarageId,
      'userGarageName': instance.userGarageName,
      'garageGovernorateName': instance.garageGovernorateName,
      'vehicleId': instance.vehicleId,
      'vehicleChassisNumber': instance.vehicleChassisNumber,
      'vehiclePlateCharacterId': instance.vehiclePlateCharacterId,
      'vehiclePlateCharacterName': instance.vehiclePlateCharacterName,
      'vehiclePlateType': instance.vehiclePlateType,
      'vehicleGovernorateId': instance.vehicleGovernorateId,
      'vehicleGovernorateName': instance.vehicleGovernorateName,
      'plateNumber': instance.plateNumber,
      'feeFines': instance.feeFines,
      'isPaid': instance.isPaid,
      'images': instance.images,
      'duplicateCount': instance.duplicateCount,
      'amount': instance.amount,
      'totalAmount': instance.totalAmount,
      'lat': instance.lat,
      'lng': instance.lng,
      'invoiceNumber': instance.invoiceNumber,
      'violationPayReceiptId': instance.violationPayReceiptId,
      'violationPayReceiptNumber': instance.violationPayReceiptNumber,
      'garageId': instance.garageId,
      'garageName': instance.garageName,
      'paymentGarageId': instance.paymentGarageId,
      'paymentGarage': instance.paymentGarage,
      'paymentReceiptNumber': instance.paymentReceiptNumber,
      'paymentDate': instance.paymentDate,
      'status': instance.status,
      'note': instance.note,
      'id': instance.id,
      'creationDate': instance.creationDate,
      'deleted': instance.deleted,
    };

_$FeeFinesImpl _$$FeeFinesImplFromJson(Map<String, dynamic> json) =>
    _$FeeFinesImpl(
      name: json['name'] as String,
      amount: (json['amount'] as num).toInt(),
      type: json['type'] as String?,
      id: json['id'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$$FeeFinesImplToJson(_$FeeFinesImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'type': instance.type,
      'id': instance.id,
      'creationDate': instance.creationDate.toIso8601String(),
      'deleted': instance.deleted,
    };
