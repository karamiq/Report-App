import 'package:freezed_annotation/freezed_annotation.dart';

part 'fee_fine_model.freezed.dart';
part 'fee_fine_model.g.dart';

@freezed
class FeeFineModel with _$FeeFineModel {
  factory FeeFineModel({
    required String name,
    required int amount,
    String? type,
    required String id,
    required DateTime creationDate,
    required bool deleted,
  }) = _FeeFineModel;

  factory FeeFineModel.fromJson(Map<String, dynamic> json) =>
      _$FeeFineModelFromJson(json);
}
