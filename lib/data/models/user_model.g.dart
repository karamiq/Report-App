// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      role: RoleModel.fromJson(json['role'] as Map<String, dynamic>),
      token: json['token'] as String,
      garageId: json['garageId'] as String?,
      garageName: json['garageName'] as String?,
      isActive: json['isActive'] as bool,
      creationDate: DateTime.parse(json['creationDate'] as String),
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'role': instance.role,
      'token': instance.token,
      'garageId': instance.garageId,
      'garageName': instance.garageName,
      'isActive': instance.isActive,
      'creationDate': instance.creationDate.toIso8601String(),
      'deleted': instance.deleted,
    };

_$RoleModelImpl _$$RoleModelImplFromJson(Map<String, dynamic> json) =>
    _$RoleModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$$RoleModelImplToJson(_$RoleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'creationDate': instance.creationDate.toIso8601String(),
      'deleted': instance.deleted,
    };
