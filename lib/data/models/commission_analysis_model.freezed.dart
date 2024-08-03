// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commission_analysis_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommissionAnalysisModel _$CommissionAnalysisModelFromJson(
    Map<String, dynamic> json) {
  return _CommissionAnalysisModel.fromJson(json);
}

/// @nodoc
mixin _$CommissionAnalysisModel {
  List<ViolationCardAnalysis> get violationCardAnalysis =>
      throw _privateConstructorUsedError;
  int get numberOfViolations => throw _privateConstructorUsedError;
  int get totalPrice => throw _privateConstructorUsedError;
  List<LastViolation> get lastViolations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommissionAnalysisModelCopyWith<CommissionAnalysisModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommissionAnalysisModelCopyWith<$Res> {
  factory $CommissionAnalysisModelCopyWith(CommissionAnalysisModel value,
          $Res Function(CommissionAnalysisModel) then) =
      _$CommissionAnalysisModelCopyWithImpl<$Res, CommissionAnalysisModel>;
  @useResult
  $Res call(
      {List<ViolationCardAnalysis> violationCardAnalysis,
      int numberOfViolations,
      int totalPrice,
      List<LastViolation> lastViolations});
}

/// @nodoc
class _$CommissionAnalysisModelCopyWithImpl<$Res,
        $Val extends CommissionAnalysisModel>
    implements $CommissionAnalysisModelCopyWith<$Res> {
  _$CommissionAnalysisModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? violationCardAnalysis = null,
    Object? numberOfViolations = null,
    Object? totalPrice = null,
    Object? lastViolations = null,
  }) {
    return _then(_value.copyWith(
      violationCardAnalysis: null == violationCardAnalysis
          ? _value.violationCardAnalysis
          : violationCardAnalysis // ignore: cast_nullable_to_non_nullable
              as List<ViolationCardAnalysis>,
      numberOfViolations: null == numberOfViolations
          ? _value.numberOfViolations
          : numberOfViolations // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      lastViolations: null == lastViolations
          ? _value.lastViolations
          : lastViolations // ignore: cast_nullable_to_non_nullable
              as List<LastViolation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommissionAnalysisModelImplCopyWith<$Res>
    implements $CommissionAnalysisModelCopyWith<$Res> {
  factory _$$CommissionAnalysisModelImplCopyWith(
          _$CommissionAnalysisModelImpl value,
          $Res Function(_$CommissionAnalysisModelImpl) then) =
      __$$CommissionAnalysisModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ViolationCardAnalysis> violationCardAnalysis,
      int numberOfViolations,
      int totalPrice,
      List<LastViolation> lastViolations});
}

/// @nodoc
class __$$CommissionAnalysisModelImplCopyWithImpl<$Res>
    extends _$CommissionAnalysisModelCopyWithImpl<$Res,
        _$CommissionAnalysisModelImpl>
    implements _$$CommissionAnalysisModelImplCopyWith<$Res> {
  __$$CommissionAnalysisModelImplCopyWithImpl(
      _$CommissionAnalysisModelImpl _value,
      $Res Function(_$CommissionAnalysisModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? violationCardAnalysis = null,
    Object? numberOfViolations = null,
    Object? totalPrice = null,
    Object? lastViolations = null,
  }) {
    return _then(_$CommissionAnalysisModelImpl(
      violationCardAnalysis: null == violationCardAnalysis
          ? _value._violationCardAnalysis
          : violationCardAnalysis // ignore: cast_nullable_to_non_nullable
              as List<ViolationCardAnalysis>,
      numberOfViolations: null == numberOfViolations
          ? _value.numberOfViolations
          : numberOfViolations // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      lastViolations: null == lastViolations
          ? _value._lastViolations
          : lastViolations // ignore: cast_nullable_to_non_nullable
              as List<LastViolation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommissionAnalysisModelImpl implements _CommissionAnalysisModel {
  _$CommissionAnalysisModelImpl(
      {required final List<ViolationCardAnalysis> violationCardAnalysis,
      required this.numberOfViolations,
      required this.totalPrice,
      required final List<LastViolation> lastViolations})
      : _violationCardAnalysis = violationCardAnalysis,
        _lastViolations = lastViolations;

  factory _$CommissionAnalysisModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommissionAnalysisModelImplFromJson(json);

  final List<ViolationCardAnalysis> _violationCardAnalysis;
  @override
  List<ViolationCardAnalysis> get violationCardAnalysis {
    if (_violationCardAnalysis is EqualUnmodifiableListView)
      return _violationCardAnalysis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_violationCardAnalysis);
  }

  @override
  final int numberOfViolations;
  @override
  final int totalPrice;
  final List<LastViolation> _lastViolations;
  @override
  List<LastViolation> get lastViolations {
    if (_lastViolations is EqualUnmodifiableListView) return _lastViolations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lastViolations);
  }

  @override
  String toString() {
    return 'CommissionAnalysisModel(violationCardAnalysis: $violationCardAnalysis, numberOfViolations: $numberOfViolations, totalPrice: $totalPrice, lastViolations: $lastViolations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommissionAnalysisModelImpl &&
            const DeepCollectionEquality()
                .equals(other._violationCardAnalysis, _violationCardAnalysis) &&
            (identical(other.numberOfViolations, numberOfViolations) ||
                other.numberOfViolations == numberOfViolations) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            const DeepCollectionEquality()
                .equals(other._lastViolations, _lastViolations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_violationCardAnalysis),
      numberOfViolations,
      totalPrice,
      const DeepCollectionEquality().hash(_lastViolations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommissionAnalysisModelImplCopyWith<_$CommissionAnalysisModelImpl>
      get copyWith => __$$CommissionAnalysisModelImplCopyWithImpl<
          _$CommissionAnalysisModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommissionAnalysisModelImplToJson(
      this,
    );
  }
}

abstract class _CommissionAnalysisModel implements CommissionAnalysisModel {
  factory _CommissionAnalysisModel(
          {required final List<ViolationCardAnalysis> violationCardAnalysis,
          required final int numberOfViolations,
          required final int totalPrice,
          required final List<LastViolation> lastViolations}) =
      _$CommissionAnalysisModelImpl;

  factory _CommissionAnalysisModel.fromJson(Map<String, dynamic> json) =
      _$CommissionAnalysisModelImpl.fromJson;

  @override
  List<ViolationCardAnalysis> get violationCardAnalysis;
  @override
  int get numberOfViolations;
  @override
  int get totalPrice;
  @override
  List<LastViolation> get lastViolations;
  @override
  @JsonKey(ignore: true)
  _$$CommissionAnalysisModelImplCopyWith<_$CommissionAnalysisModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ViolationCardAnalysis _$ViolationCardAnalysisFromJson(
    Map<String, dynamic> json) {
  return _ViolationCardAnalysis.fromJson(json);
}

/// @nodoc
mixin _$ViolationCardAnalysis {
  String get name => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ViolationCardAnalysisCopyWith<ViolationCardAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViolationCardAnalysisCopyWith<$Res> {
  factory $ViolationCardAnalysisCopyWith(ViolationCardAnalysis value,
          $Res Function(ViolationCardAnalysis) then) =
      _$ViolationCardAnalysisCopyWithImpl<$Res, ViolationCardAnalysis>;
  @useResult
  $Res call({String name, int amount});
}

/// @nodoc
class _$ViolationCardAnalysisCopyWithImpl<$Res,
        $Val extends ViolationCardAnalysis>
    implements $ViolationCardAnalysisCopyWith<$Res> {
  _$ViolationCardAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViolationCardAnalysisImplCopyWith<$Res>
    implements $ViolationCardAnalysisCopyWith<$Res> {
  factory _$$ViolationCardAnalysisImplCopyWith(
          _$ViolationCardAnalysisImpl value,
          $Res Function(_$ViolationCardAnalysisImpl) then) =
      __$$ViolationCardAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int amount});
}

/// @nodoc
class __$$ViolationCardAnalysisImplCopyWithImpl<$Res>
    extends _$ViolationCardAnalysisCopyWithImpl<$Res,
        _$ViolationCardAnalysisImpl>
    implements _$$ViolationCardAnalysisImplCopyWith<$Res> {
  __$$ViolationCardAnalysisImplCopyWithImpl(_$ViolationCardAnalysisImpl _value,
      $Res Function(_$ViolationCardAnalysisImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
  }) {
    return _then(_$ViolationCardAnalysisImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViolationCardAnalysisImpl implements _ViolationCardAnalysis {
  _$ViolationCardAnalysisImpl({required this.name, required this.amount});

  factory _$ViolationCardAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViolationCardAnalysisImplFromJson(json);

  @override
  final String name;
  @override
  final int amount;

  @override
  String toString() {
    return 'ViolationCardAnalysis(name: $name, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViolationCardAnalysisImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViolationCardAnalysisImplCopyWith<_$ViolationCardAnalysisImpl>
      get copyWith => __$$ViolationCardAnalysisImplCopyWithImpl<
          _$ViolationCardAnalysisImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViolationCardAnalysisImplToJson(
      this,
    );
  }
}

abstract class _ViolationCardAnalysis implements ViolationCardAnalysis {
  factory _ViolationCardAnalysis(
      {required final String name,
      required final int amount}) = _$ViolationCardAnalysisImpl;

  factory _ViolationCardAnalysis.fromJson(Map<String, dynamic> json) =
      _$ViolationCardAnalysisImpl.fromJson;

  @override
  String get name;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$ViolationCardAnalysisImplCopyWith<_$ViolationCardAnalysisImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LastViolation _$LastViolationFromJson(Map<String, dynamic> json) {
  return _LastViolation.fromJson(json);
}

/// @nodoc
mixin _$LastViolation {
  int get number => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get userFullName => throw _privateConstructorUsedError;
  String? get userGarageId => throw _privateConstructorUsedError;
  String? get userGarageName => throw _privateConstructorUsedError;
  String? get garageGovernorateName => throw _privateConstructorUsedError;
  String? get vehicleId => throw _privateConstructorUsedError;
  String? get vehicleChassisNumber => throw _privateConstructorUsedError;
  String? get vehiclePlateCharacterId => throw _privateConstructorUsedError;
  String? get vehiclePlateCharacterName => throw _privateConstructorUsedError;
  String? get vehiclePlateType => throw _privateConstructorUsedError;
  String? get vehicleGovernorateId => throw _privateConstructorUsedError;
  String? get vehicleGovernorateName => throw _privateConstructorUsedError;
  String? get plateNumber => throw _privateConstructorUsedError;
  FeeFines get feeFines => throw _privateConstructorUsedError;
  bool get isPaid => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  int get duplicateCount => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  int get totalAmount => throw _privateConstructorUsedError;
  String? get lat => throw _privateConstructorUsedError;
  String? get lng => throw _privateConstructorUsedError;
  int get invoiceNumber => throw _privateConstructorUsedError;
  String? get garageId => throw _privateConstructorUsedError;
  String? get garageName => throw _privateConstructorUsedError;
  String? get paymentGarageId => throw _privateConstructorUsedError;
  GaragePayment? get paymentGarage => throw _privateConstructorUsedError;
  int? get paymentReceiptNumber => throw _privateConstructorUsedError;
  String? get paymentDate => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  bool get isDirect => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get creationDate => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LastViolationCopyWith<LastViolation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastViolationCopyWith<$Res> {
  factory $LastViolationCopyWith(
          LastViolation value, $Res Function(LastViolation) then) =
      _$LastViolationCopyWithImpl<$Res, LastViolation>;
  @useResult
  $Res call(
      {int number,
      String? userId,
      String? userFullName,
      String? userGarageId,
      String? userGarageName,
      String? garageGovernorateName,
      String? vehicleId,
      String? vehicleChassisNumber,
      String? vehiclePlateCharacterId,
      String? vehiclePlateCharacterName,
      String? vehiclePlateType,
      String? vehicleGovernorateId,
      String? vehicleGovernorateName,
      String? plateNumber,
      FeeFines feeFines,
      bool isPaid,
      List<String> images,
      int duplicateCount,
      int amount,
      int totalAmount,
      String? lat,
      String? lng,
      int invoiceNumber,
      String? garageId,
      String? garageName,
      String? paymentGarageId,
      GaragePayment? paymentGarage,
      int? paymentReceiptNumber,
      String? paymentDate,
      int status,
      String? note,
      bool isDirect,
      String id,
      String creationDate,
      bool deleted});

  $FeeFinesCopyWith<$Res> get feeFines;
  $GaragePaymentCopyWith<$Res>? get paymentGarage;
}

/// @nodoc
class _$LastViolationCopyWithImpl<$Res, $Val extends LastViolation>
    implements $LastViolationCopyWith<$Res> {
  _$LastViolationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? userId = freezed,
    Object? userFullName = freezed,
    Object? userGarageId = freezed,
    Object? userGarageName = freezed,
    Object? garageGovernorateName = freezed,
    Object? vehicleId = freezed,
    Object? vehicleChassisNumber = freezed,
    Object? vehiclePlateCharacterId = freezed,
    Object? vehiclePlateCharacterName = freezed,
    Object? vehiclePlateType = freezed,
    Object? vehicleGovernorateId = freezed,
    Object? vehicleGovernorateName = freezed,
    Object? plateNumber = freezed,
    Object? feeFines = null,
    Object? isPaid = null,
    Object? images = null,
    Object? duplicateCount = null,
    Object? amount = null,
    Object? totalAmount = null,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? invoiceNumber = null,
    Object? garageId = freezed,
    Object? garageName = freezed,
    Object? paymentGarageId = freezed,
    Object? paymentGarage = freezed,
    Object? paymentReceiptNumber = freezed,
    Object? paymentDate = freezed,
    Object? status = null,
    Object? note = freezed,
    Object? isDirect = null,
    Object? id = null,
    Object? creationDate = null,
    Object? deleted = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userFullName: freezed == userFullName
          ? _value.userFullName
          : userFullName // ignore: cast_nullable_to_non_nullable
              as String?,
      userGarageId: freezed == userGarageId
          ? _value.userGarageId
          : userGarageId // ignore: cast_nullable_to_non_nullable
              as String?,
      userGarageName: freezed == userGarageName
          ? _value.userGarageName
          : userGarageName // ignore: cast_nullable_to_non_nullable
              as String?,
      garageGovernorateName: freezed == garageGovernorateName
          ? _value.garageGovernorateName
          : garageGovernorateName // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleId: freezed == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleChassisNumber: freezed == vehicleChassisNumber
          ? _value.vehicleChassisNumber
          : vehicleChassisNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      vehiclePlateCharacterId: freezed == vehiclePlateCharacterId
          ? _value.vehiclePlateCharacterId
          : vehiclePlateCharacterId // ignore: cast_nullable_to_non_nullable
              as String?,
      vehiclePlateCharacterName: freezed == vehiclePlateCharacterName
          ? _value.vehiclePlateCharacterName
          : vehiclePlateCharacterName // ignore: cast_nullable_to_non_nullable
              as String?,
      vehiclePlateType: freezed == vehiclePlateType
          ? _value.vehiclePlateType
          : vehiclePlateType // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleGovernorateId: freezed == vehicleGovernorateId
          ? _value.vehicleGovernorateId
          : vehicleGovernorateId // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleGovernorateName: freezed == vehicleGovernorateName
          ? _value.vehicleGovernorateName
          : vehicleGovernorateName // ignore: cast_nullable_to_non_nullable
              as String?,
      plateNumber: freezed == plateNumber
          ? _value.plateNumber
          : plateNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      feeFines: null == feeFines
          ? _value.feeFines
          : feeFines // ignore: cast_nullable_to_non_nullable
              as FeeFines,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      duplicateCount: null == duplicateCount
          ? _value.duplicateCount
          : duplicateCount // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      garageId: freezed == garageId
          ? _value.garageId
          : garageId // ignore: cast_nullable_to_non_nullable
              as String?,
      garageName: freezed == garageName
          ? _value.garageName
          : garageName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentGarageId: freezed == paymentGarageId
          ? _value.paymentGarageId
          : paymentGarageId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentGarage: freezed == paymentGarage
          ? _value.paymentGarage
          : paymentGarage // ignore: cast_nullable_to_non_nullable
              as GaragePayment?,
      paymentReceiptNumber: freezed == paymentReceiptNumber
          ? _value.paymentReceiptNumber
          : paymentReceiptNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isDirect: null == isDirect
          ? _value.isDirect
          : isDirect // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FeeFinesCopyWith<$Res> get feeFines {
    return $FeeFinesCopyWith<$Res>(_value.feeFines, (value) {
      return _then(_value.copyWith(feeFines: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GaragePaymentCopyWith<$Res>? get paymentGarage {
    if (_value.paymentGarage == null) {
      return null;
    }

    return $GaragePaymentCopyWith<$Res>(_value.paymentGarage!, (value) {
      return _then(_value.copyWith(paymentGarage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LastViolationImplCopyWith<$Res>
    implements $LastViolationCopyWith<$Res> {
  factory _$$LastViolationImplCopyWith(
          _$LastViolationImpl value, $Res Function(_$LastViolationImpl) then) =
      __$$LastViolationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int number,
      String? userId,
      String? userFullName,
      String? userGarageId,
      String? userGarageName,
      String? garageGovernorateName,
      String? vehicleId,
      String? vehicleChassisNumber,
      String? vehiclePlateCharacterId,
      String? vehiclePlateCharacterName,
      String? vehiclePlateType,
      String? vehicleGovernorateId,
      String? vehicleGovernorateName,
      String? plateNumber,
      FeeFines feeFines,
      bool isPaid,
      List<String> images,
      int duplicateCount,
      int amount,
      int totalAmount,
      String? lat,
      String? lng,
      int invoiceNumber,
      String? garageId,
      String? garageName,
      String? paymentGarageId,
      GaragePayment? paymentGarage,
      int? paymentReceiptNumber,
      String? paymentDate,
      int status,
      String? note,
      bool isDirect,
      String id,
      String creationDate,
      bool deleted});

  @override
  $FeeFinesCopyWith<$Res> get feeFines;
  @override
  $GaragePaymentCopyWith<$Res>? get paymentGarage;
}

/// @nodoc
class __$$LastViolationImplCopyWithImpl<$Res>
    extends _$LastViolationCopyWithImpl<$Res, _$LastViolationImpl>
    implements _$$LastViolationImplCopyWith<$Res> {
  __$$LastViolationImplCopyWithImpl(
      _$LastViolationImpl _value, $Res Function(_$LastViolationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? userId = freezed,
    Object? userFullName = freezed,
    Object? userGarageId = freezed,
    Object? userGarageName = freezed,
    Object? garageGovernorateName = freezed,
    Object? vehicleId = freezed,
    Object? vehicleChassisNumber = freezed,
    Object? vehiclePlateCharacterId = freezed,
    Object? vehiclePlateCharacterName = freezed,
    Object? vehiclePlateType = freezed,
    Object? vehicleGovernorateId = freezed,
    Object? vehicleGovernorateName = freezed,
    Object? plateNumber = freezed,
    Object? feeFines = null,
    Object? isPaid = null,
    Object? images = null,
    Object? duplicateCount = null,
    Object? amount = null,
    Object? totalAmount = null,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? invoiceNumber = null,
    Object? garageId = freezed,
    Object? garageName = freezed,
    Object? paymentGarageId = freezed,
    Object? paymentGarage = freezed,
    Object? paymentReceiptNumber = freezed,
    Object? paymentDate = freezed,
    Object? status = null,
    Object? note = freezed,
    Object? isDirect = null,
    Object? id = null,
    Object? creationDate = null,
    Object? deleted = null,
  }) {
    return _then(_$LastViolationImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userFullName: freezed == userFullName
          ? _value.userFullName
          : userFullName // ignore: cast_nullable_to_non_nullable
              as String?,
      userGarageId: freezed == userGarageId
          ? _value.userGarageId
          : userGarageId // ignore: cast_nullable_to_non_nullable
              as String?,
      userGarageName: freezed == userGarageName
          ? _value.userGarageName
          : userGarageName // ignore: cast_nullable_to_non_nullable
              as String?,
      garageGovernorateName: freezed == garageGovernorateName
          ? _value.garageGovernorateName
          : garageGovernorateName // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleId: freezed == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleChassisNumber: freezed == vehicleChassisNumber
          ? _value.vehicleChassisNumber
          : vehicleChassisNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      vehiclePlateCharacterId: freezed == vehiclePlateCharacterId
          ? _value.vehiclePlateCharacterId
          : vehiclePlateCharacterId // ignore: cast_nullable_to_non_nullable
              as String?,
      vehiclePlateCharacterName: freezed == vehiclePlateCharacterName
          ? _value.vehiclePlateCharacterName
          : vehiclePlateCharacterName // ignore: cast_nullable_to_non_nullable
              as String?,
      vehiclePlateType: freezed == vehiclePlateType
          ? _value.vehiclePlateType
          : vehiclePlateType // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleGovernorateId: freezed == vehicleGovernorateId
          ? _value.vehicleGovernorateId
          : vehicleGovernorateId // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleGovernorateName: freezed == vehicleGovernorateName
          ? _value.vehicleGovernorateName
          : vehicleGovernorateName // ignore: cast_nullable_to_non_nullable
              as String?,
      plateNumber: freezed == plateNumber
          ? _value.plateNumber
          : plateNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      feeFines: null == feeFines
          ? _value.feeFines
          : feeFines // ignore: cast_nullable_to_non_nullable
              as FeeFines,
      isPaid: null == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      duplicateCount: null == duplicateCount
          ? _value.duplicateCount
          : duplicateCount // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as int,
      garageId: freezed == garageId
          ? _value.garageId
          : garageId // ignore: cast_nullable_to_non_nullable
              as String?,
      garageName: freezed == garageName
          ? _value.garageName
          : garageName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentGarageId: freezed == paymentGarageId
          ? _value.paymentGarageId
          : paymentGarageId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentGarage: freezed == paymentGarage
          ? _value.paymentGarage
          : paymentGarage // ignore: cast_nullable_to_non_nullable
              as GaragePayment?,
      paymentReceiptNumber: freezed == paymentReceiptNumber
          ? _value.paymentReceiptNumber
          : paymentReceiptNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      isDirect: null == isDirect
          ? _value.isDirect
          : isDirect // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LastViolationImpl implements _LastViolation {
  _$LastViolationImpl(
      {required this.number,
      required this.userId,
      required this.userFullName,
      required this.userGarageId,
      this.userGarageName,
      this.garageGovernorateName,
      required this.vehicleId,
      required this.vehicleChassisNumber,
      required this.vehiclePlateCharacterId,
      required this.vehiclePlateCharacterName,
      this.vehiclePlateType,
      required this.vehicleGovernorateId,
      this.vehicleGovernorateName,
      required this.plateNumber,
      required this.feeFines,
      required this.isPaid,
      required final List<String> images,
      required this.duplicateCount,
      required this.amount,
      required this.totalAmount,
      this.lat,
      this.lng,
      required this.invoiceNumber,
      required this.garageId,
      this.garageName,
      this.paymentGarageId,
      this.paymentGarage,
      this.paymentReceiptNumber,
      this.paymentDate,
      required this.status,
      this.note,
      required this.isDirect,
      required this.id,
      required this.creationDate,
      required this.deleted})
      : _images = images;

  factory _$LastViolationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LastViolationImplFromJson(json);

  @override
  final int number;
  @override
  final String? userId;
  @override
  final String? userFullName;
  @override
  final String? userGarageId;
  @override
  final String? userGarageName;
  @override
  final String? garageGovernorateName;
  @override
  final String? vehicleId;
  @override
  final String? vehicleChassisNumber;
  @override
  final String? vehiclePlateCharacterId;
  @override
  final String? vehiclePlateCharacterName;
  @override
  final String? vehiclePlateType;
  @override
  final String? vehicleGovernorateId;
  @override
  final String? vehicleGovernorateName;
  @override
  final String? plateNumber;
  @override
  final FeeFines feeFines;
  @override
  final bool isPaid;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final int duplicateCount;
  @override
  final int amount;
  @override
  final int totalAmount;
  @override
  final String? lat;
  @override
  final String? lng;
  @override
  final int invoiceNumber;
  @override
  final String? garageId;
  @override
  final String? garageName;
  @override
  final String? paymentGarageId;
  @override
  final GaragePayment? paymentGarage;
  @override
  final int? paymentReceiptNumber;
  @override
  final String? paymentDate;
  @override
  final int status;
  @override
  final String? note;
  @override
  final bool isDirect;
  @override
  final String id;
  @override
  final String creationDate;
  @override
  final bool deleted;

  @override
  String toString() {
    return 'LastViolation(number: $number, userId: $userId, userFullName: $userFullName, userGarageId: $userGarageId, userGarageName: $userGarageName, garageGovernorateName: $garageGovernorateName, vehicleId: $vehicleId, vehicleChassisNumber: $vehicleChassisNumber, vehiclePlateCharacterId: $vehiclePlateCharacterId, vehiclePlateCharacterName: $vehiclePlateCharacterName, vehiclePlateType: $vehiclePlateType, vehicleGovernorateId: $vehicleGovernorateId, vehicleGovernorateName: $vehicleGovernorateName, plateNumber: $plateNumber, feeFines: $feeFines, isPaid: $isPaid, images: $images, duplicateCount: $duplicateCount, amount: $amount, totalAmount: $totalAmount, lat: $lat, lng: $lng, invoiceNumber: $invoiceNumber, garageId: $garageId, garageName: $garageName, paymentGarageId: $paymentGarageId, paymentGarage: $paymentGarage, paymentReceiptNumber: $paymentReceiptNumber, paymentDate: $paymentDate, status: $status, note: $note, isDirect: $isDirect, id: $id, creationDate: $creationDate, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastViolationImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userFullName, userFullName) ||
                other.userFullName == userFullName) &&
            (identical(other.userGarageId, userGarageId) ||
                other.userGarageId == userGarageId) &&
            (identical(other.userGarageName, userGarageName) ||
                other.userGarageName == userGarageName) &&
            (identical(other.garageGovernorateName, garageGovernorateName) ||
                other.garageGovernorateName == garageGovernorateName) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.vehicleChassisNumber, vehicleChassisNumber) ||
                other.vehicleChassisNumber == vehicleChassisNumber) &&
            (identical(
                    other.vehiclePlateCharacterId, vehiclePlateCharacterId) ||
                other.vehiclePlateCharacterId == vehiclePlateCharacterId) &&
            (identical(other.vehiclePlateCharacterName,
                    vehiclePlateCharacterName) ||
                other.vehiclePlateCharacterName == vehiclePlateCharacterName) &&
            (identical(other.vehiclePlateType, vehiclePlateType) ||
                other.vehiclePlateType == vehiclePlateType) &&
            (identical(other.vehicleGovernorateId, vehicleGovernorateId) ||
                other.vehicleGovernorateId == vehicleGovernorateId) &&
            (identical(other.vehicleGovernorateName, vehicleGovernorateName) ||
                other.vehicleGovernorateName == vehicleGovernorateName) &&
            (identical(other.plateNumber, plateNumber) ||
                other.plateNumber == plateNumber) &&
            (identical(other.feeFines, feeFines) ||
                other.feeFines == feeFines) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.duplicateCount, duplicateCount) ||
                other.duplicateCount == duplicateCount) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.garageId, garageId) ||
                other.garageId == garageId) &&
            (identical(other.garageName, garageName) ||
                other.garageName == garageName) &&
            (identical(other.paymentGarageId, paymentGarageId) ||
                other.paymentGarageId == paymentGarageId) &&
            (identical(other.paymentGarage, paymentGarage) ||
                other.paymentGarage == paymentGarage) &&
            (identical(other.paymentReceiptNumber, paymentReceiptNumber) ||
                other.paymentReceiptNumber == paymentReceiptNumber) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.isDirect, isDirect) ||
                other.isDirect == isDirect) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        number,
        userId,
        userFullName,
        userGarageId,
        userGarageName,
        garageGovernorateName,
        vehicleId,
        vehicleChassisNumber,
        vehiclePlateCharacterId,
        vehiclePlateCharacterName,
        vehiclePlateType,
        vehicleGovernorateId,
        vehicleGovernorateName,
        plateNumber,
        feeFines,
        isPaid,
        const DeepCollectionEquality().hash(_images),
        duplicateCount,
        amount,
        totalAmount,
        lat,
        lng,
        invoiceNumber,
        garageId,
        garageName,
        paymentGarageId,
        paymentGarage,
        paymentReceiptNumber,
        paymentDate,
        status,
        note,
        isDirect,
        id,
        creationDate,
        deleted
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LastViolationImplCopyWith<_$LastViolationImpl> get copyWith =>
      __$$LastViolationImplCopyWithImpl<_$LastViolationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LastViolationImplToJson(
      this,
    );
  }
}

abstract class _LastViolation implements LastViolation {
  factory _LastViolation(
      {required final int number,
      required final String? userId,
      required final String? userFullName,
      required final String? userGarageId,
      final String? userGarageName,
      final String? garageGovernorateName,
      required final String? vehicleId,
      required final String? vehicleChassisNumber,
      required final String? vehiclePlateCharacterId,
      required final String? vehiclePlateCharacterName,
      final String? vehiclePlateType,
      required final String? vehicleGovernorateId,
      final String? vehicleGovernorateName,
      required final String? plateNumber,
      required final FeeFines feeFines,
      required final bool isPaid,
      required final List<String> images,
      required final int duplicateCount,
      required final int amount,
      required final int totalAmount,
      final String? lat,
      final String? lng,
      required final int invoiceNumber,
      required final String? garageId,
      final String? garageName,
      final String? paymentGarageId,
      final GaragePayment? paymentGarage,
      final int? paymentReceiptNumber,
      final String? paymentDate,
      required final int status,
      final String? note,
      required final bool isDirect,
      required final String id,
      required final String creationDate,
      required final bool deleted}) = _$LastViolationImpl;

  factory _LastViolation.fromJson(Map<String, dynamic> json) =
      _$LastViolationImpl.fromJson;

  @override
  int get number;
  @override
  String? get userId;
  @override
  String? get userFullName;
  @override
  String? get userGarageId;
  @override
  String? get userGarageName;
  @override
  String? get garageGovernorateName;
  @override
  String? get vehicleId;
  @override
  String? get vehicleChassisNumber;
  @override
  String? get vehiclePlateCharacterId;
  @override
  String? get vehiclePlateCharacterName;
  @override
  String? get vehiclePlateType;
  @override
  String? get vehicleGovernorateId;
  @override
  String? get vehicleGovernorateName;
  @override
  String? get plateNumber;
  @override
  FeeFines get feeFines;
  @override
  bool get isPaid;
  @override
  List<String> get images;
  @override
  int get duplicateCount;
  @override
  int get amount;
  @override
  int get totalAmount;
  @override
  String? get lat;
  @override
  String? get lng;
  @override
  int get invoiceNumber;
  @override
  String? get garageId;
  @override
  String? get garageName;
  @override
  String? get paymentGarageId;
  @override
  GaragePayment? get paymentGarage;
  @override
  int? get paymentReceiptNumber;
  @override
  String? get paymentDate;
  @override
  int get status;
  @override
  String? get note;
  @override
  bool get isDirect;
  @override
  String get id;
  @override
  String get creationDate;
  @override
  bool get deleted;
  @override
  @JsonKey(ignore: true)
  _$$LastViolationImplCopyWith<_$LastViolationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeeFines _$FeeFinesFromJson(Map<String, dynamic> json) {
  return _FeeFines.fromJson(json);
}

/// @nodoc
mixin _$FeeFines {
  String get name => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get creationDate => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeeFinesCopyWith<FeeFines> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeeFinesCopyWith<$Res> {
  factory $FeeFinesCopyWith(FeeFines value, $Res Function(FeeFines) then) =
      _$FeeFinesCopyWithImpl<$Res, FeeFines>;
  @useResult
  $Res call(
      {String name,
      int amount,
      String? type,
      String id,
      String creationDate,
      bool deleted});
}

/// @nodoc
class _$FeeFinesCopyWithImpl<$Res, $Val extends FeeFines>
    implements $FeeFinesCopyWith<$Res> {
  _$FeeFinesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
    Object? type = freezed,
    Object? id = null,
    Object? creationDate = null,
    Object? deleted = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeeFinesImplCopyWith<$Res>
    implements $FeeFinesCopyWith<$Res> {
  factory _$$FeeFinesImplCopyWith(
          _$FeeFinesImpl value, $Res Function(_$FeeFinesImpl) then) =
      __$$FeeFinesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int amount,
      String? type,
      String id,
      String creationDate,
      bool deleted});
}

/// @nodoc
class __$$FeeFinesImplCopyWithImpl<$Res>
    extends _$FeeFinesCopyWithImpl<$Res, _$FeeFinesImpl>
    implements _$$FeeFinesImplCopyWith<$Res> {
  __$$FeeFinesImplCopyWithImpl(
      _$FeeFinesImpl _value, $Res Function(_$FeeFinesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
    Object? type = freezed,
    Object? id = null,
    Object? creationDate = null,
    Object? deleted = null,
  }) {
    return _then(_$FeeFinesImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeeFinesImpl implements _FeeFines {
  _$FeeFinesImpl(
      {required this.name,
      required this.amount,
      this.type,
      required this.id,
      required this.creationDate,
      required this.deleted});

  factory _$FeeFinesImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeeFinesImplFromJson(json);

  @override
  final String name;
  @override
  final int amount;
  @override
  final String? type;
  @override
  final String id;
  @override
  final String creationDate;
  @override
  final bool deleted;

  @override
  String toString() {
    return 'FeeFines(name: $name, amount: $amount, type: $type, id: $id, creationDate: $creationDate, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeeFinesImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.deleted, deleted) || other.deleted == deleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, amount, type, id, creationDate, deleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeeFinesImplCopyWith<_$FeeFinesImpl> get copyWith =>
      __$$FeeFinesImplCopyWithImpl<_$FeeFinesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeeFinesImplToJson(
      this,
    );
  }
}

abstract class _FeeFines implements FeeFines {
  factory _FeeFines(
      {required final String name,
      required final int amount,
      final String? type,
      required final String id,
      required final String creationDate,
      required final bool deleted}) = _$FeeFinesImpl;

  factory _FeeFines.fromJson(Map<String, dynamic> json) =
      _$FeeFinesImpl.fromJson;

  @override
  String get name;
  @override
  int get amount;
  @override
  String? get type;
  @override
  String get id;
  @override
  String get creationDate;
  @override
  bool get deleted;
  @override
  @JsonKey(ignore: true)
  _$$FeeFinesImplCopyWith<_$FeeFinesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GaragePayment _$GaragePaymentFromJson(Map<String, dynamic> json) {
  return _GaragePayment.fromJson(json);
}

/// @nodoc
mixin _$GaragePayment {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GaragePaymentCopyWith<GaragePayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GaragePaymentCopyWith<$Res> {
  factory $GaragePaymentCopyWith(
          GaragePayment value, $Res Function(GaragePayment) then) =
      _$GaragePaymentCopyWithImpl<$Res, GaragePayment>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? address,
      String? phone,
      String? email});
}

/// @nodoc
class _$GaragePaymentCopyWithImpl<$Res, $Val extends GaragePayment>
    implements $GaragePaymentCopyWith<$Res> {
  _$GaragePaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GaragePaymentImplCopyWith<$Res>
    implements $GaragePaymentCopyWith<$Res> {
  factory _$$GaragePaymentImplCopyWith(
          _$GaragePaymentImpl value, $Res Function(_$GaragePaymentImpl) then) =
      __$$GaragePaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? address,
      String? phone,
      String? email});
}

/// @nodoc
class __$$GaragePaymentImplCopyWithImpl<$Res>
    extends _$GaragePaymentCopyWithImpl<$Res, _$GaragePaymentImpl>
    implements _$$GaragePaymentImplCopyWith<$Res> {
  __$$GaragePaymentImplCopyWithImpl(
      _$GaragePaymentImpl _value, $Res Function(_$GaragePaymentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? email = freezed,
  }) {
    return _then(_$GaragePaymentImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GaragePaymentImpl implements _GaragePayment {
  _$GaragePaymentImpl(
      {required this.id,
      required this.name,
      required this.address,
      required this.phone,
      required this.email});

  factory _$GaragePaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$GaragePaymentImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? phone;
  @override
  final String? email;

  @override
  String toString() {
    return 'GaragePayment(id: $id, name: $name, address: $address, phone: $phone, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GaragePaymentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address, phone, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GaragePaymentImplCopyWith<_$GaragePaymentImpl> get copyWith =>
      __$$GaragePaymentImplCopyWithImpl<_$GaragePaymentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GaragePaymentImplToJson(
      this,
    );
  }
}

abstract class _GaragePayment implements GaragePayment {
  factory _GaragePayment(
      {required final String? id,
      required final String? name,
      required final String? address,
      required final String? phone,
      required final String? email}) = _$GaragePaymentImpl;

  factory _GaragePayment.fromJson(Map<String, dynamic> json) =
      _$GaragePaymentImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get address;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$GaragePaymentImplCopyWith<_$GaragePaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
