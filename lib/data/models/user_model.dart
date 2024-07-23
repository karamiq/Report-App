import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String fullName,
    required String email,
    required RoleModel role,
    required String token,
    String? garageId,
    String? garageName,
    required bool isActive,
    required DateTime creationDate,
    required bool deleted,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class RoleModel with _$RoleModel {
  // Updated class name
  const factory RoleModel({
    required String id,
    required String name,
    required DateTime creationDate,
    required bool deleted,
  }) = _RoleModel;

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);
}
