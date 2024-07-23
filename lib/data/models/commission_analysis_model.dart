import 'package:freezed_annotation/freezed_annotation.dart';

part 'commission_analysis_model.freezed.dart';
part 'commission_analysis_model.g.dart';

@freezed
class CommissionAnalysisModel with _$CommissionAnalysisModel {
  const factory CommissionAnalysisModel({
    required List<ViolationCardAnalysis> violationCardAnalysis,
    required int numberOfViolations,
    required int totalPrice,
    required List<LastViolation> lastViolations,
  }) = _CommissionAnalysisModel;

  factory CommissionAnalysisModel.fromJson(Map<String, dynamic> json) =>
      _$CommissionAnalysisModelFromJson(json);
}

@freezed
class ViolationCardAnalysis with _$ViolationCardAnalysis {
  const factory ViolationCardAnalysis({
    required String name,
    required int amount,
  }) = _ViolationCardAnalysis;

  factory ViolationCardAnalysis.fromJson(Map<String, dynamic> json) =>
      _$ViolationCardAnalysisFromJson(json);
}

@freezed
class LastViolation with _$LastViolation {
  const factory LastViolation({
    required int number,
    required String userId,
    required String userFullName,
    required String userGarageId,
    String? userGarageName,
    String? garageGovernorateName,
    required String vehicleId,
    required String vehicleChassisNumber,
    required String vehiclePlateCharacterId,
    required String vehiclePlateCharacterName,
    String? vehiclePlateType,
    required String vehicleGovernorateId,
    String? vehicleGovernorateName,
    required String plateNumber,
    required FeeFines feeFines,
    required bool isPaid,
    required List<String> images,
    required int duplicateCount,
    required int amount,
    required int totalAmount,
    String? lat,
    String? lng,
    required int invoiceNumber,
    String? violationPayReceiptId,
    String? violationPayReceiptNumber,
    required String garageId,
    String? garageName,
    String? paymentGarageId,
    String? paymentGarage,
    String? paymentReceiptNumber,
    String? paymentDate,
    required int status,
    String? note,
    required String id,
    required String creationDate,
    required bool deleted,
  }) = _LastViolation;

  factory LastViolation.fromJson(Map<String, dynamic> json) =>
      _$LastViolationFromJson(json);
}

@freezed
class FeeFines with _$FeeFines {
  const factory FeeFines({
    required String name,
    required int amount,
    String? type,
    required String id,
    required DateTime creationDate,
    required bool deleted,
  }) = _FeeFines;

  factory FeeFines.fromJson(Map<String, dynamic> json) =>
      _$FeeFinesFromJson(json);
}
