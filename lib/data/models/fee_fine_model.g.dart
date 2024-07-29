// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee_fine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeeFineModelImpl _$$FeeFineModelImplFromJson(Map<String, dynamic> json) =>
    _$FeeFineModelImpl(
      id: json['id'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      deleted: json['deleted'] as bool,
      name: json['name'] as String,
      amount: (json['amount'] as num).toInt(),
      type: (json['type'] as num).toInt(),
    );

Map<String, dynamic> _$$FeeFineModelImplToJson(_$FeeFineModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creationDate': instance.creationDate.toIso8601String(),
      'deleted': instance.deleted,
      'name': instance.name,
      'amount': instance.amount,
      'type': instance.type,
    };
