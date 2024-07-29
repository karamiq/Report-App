import 'package:freezed_annotation/freezed_annotation.dart';

part 'fee_fine_model.freezed.dart';
part 'fee_fine_model.g.dart';

@freezed
class FeeFineModel with _$FeeFineModel {
  const factory FeeFineModel({
    required String id,
    required DateTime creationDate,
    required bool deleted,
    required String name,
    required int amount,
    required int type,
  }) = _FeeFineModel;

  factory FeeFineModel.fromJson(Map<String, dynamic> json) =>
      _$FeeFineModelFromJson(json);
}
