// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fee_fine_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeeFineModel _$FeeFineModelFromJson(Map<String, dynamic> json) {
  return _FeeFineModel.fromJson(json);
}

/// @nodoc
mixin _$FeeFineModel {
  String get name => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeeFineModelCopyWith<FeeFineModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeeFineModelCopyWith<$Res> {
  factory $FeeFineModelCopyWith(
          FeeFineModel value, $Res Function(FeeFineModel) then) =
      _$FeeFineModelCopyWithImpl<$Res, FeeFineModel>;
  @useResult
  $Res call(
      {String name,
      int amount,
      String? type,
      String id,
      DateTime creationDate,
      bool deleted});
}

/// @nodoc
class _$FeeFineModelCopyWithImpl<$Res, $Val extends FeeFineModel>
    implements $FeeFineModelCopyWith<$Res> {
  _$FeeFineModelCopyWithImpl(this._value, this._then);

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
              as DateTime,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeeFineModelImplCopyWith<$Res>
    implements $FeeFineModelCopyWith<$Res> {
  factory _$$FeeFineModelImplCopyWith(
          _$FeeFineModelImpl value, $Res Function(_$FeeFineModelImpl) then) =
      __$$FeeFineModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int amount,
      String? type,
      String id,
      DateTime creationDate,
      bool deleted});
}

/// @nodoc
class __$$FeeFineModelImplCopyWithImpl<$Res>
    extends _$FeeFineModelCopyWithImpl<$Res, _$FeeFineModelImpl>
    implements _$$FeeFineModelImplCopyWith<$Res> {
  __$$FeeFineModelImplCopyWithImpl(
      _$FeeFineModelImpl _value, $Res Function(_$FeeFineModelImpl) _then)
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
    return _then(_$FeeFineModelImpl(
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
              as DateTime,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeeFineModelImpl implements _FeeFineModel {
  _$FeeFineModelImpl(
      {required this.name,
      required this.amount,
      this.type,
      required this.id,
      required this.creationDate,
      required this.deleted});

  factory _$FeeFineModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeeFineModelImplFromJson(json);

  @override
  final String name;
  @override
  final int amount;
  @override
  final String? type;
  @override
  final String id;
  @override
  final DateTime creationDate;
  @override
  final bool deleted;

  @override
  String toString() {
    return 'FeeFineModel(name: $name, amount: $amount, type: $type, id: $id, creationDate: $creationDate, deleted: $deleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeeFineModelImpl &&
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
  _$$FeeFineModelImplCopyWith<_$FeeFineModelImpl> get copyWith =>
      __$$FeeFineModelImplCopyWithImpl<_$FeeFineModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeeFineModelImplToJson(
      this,
    );
  }
}

abstract class _FeeFineModel implements FeeFineModel {
  factory _FeeFineModel(
      {required final String name,
      required final int amount,
      final String? type,
      required final String id,
      required final DateTime creationDate,
      required final bool deleted}) = _$FeeFineModelImpl;

  factory _FeeFineModel.fromJson(Map<String, dynamic> json) =
      _$FeeFineModelImpl.fromJson;

  @override
  String get name;
  @override
  int get amount;
  @override
  String? get type;
  @override
  String get id;
  @override
  DateTime get creationDate;
  @override
  bool get deleted;
  @override
  @JsonKey(ignore: true)
  _$$FeeFineModelImplCopyWith<_$FeeFineModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
