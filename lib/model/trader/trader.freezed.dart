// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trader.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Trader _$TraderFromJson(Map<String, dynamic> json) {
  return _Trader.fromJson(json);
}

/// @nodoc
mixin _$Trader {
  String get traderSurName => throw _privateConstructorUsedError;
  String get traderPersonalName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TraderCopyWith<Trader> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TraderCopyWith<$Res> {
  factory $TraderCopyWith(Trader value, $Res Function(Trader) then) =
      _$TraderCopyWithImpl<$Res, Trader>;
  @useResult
  $Res call({String traderSurName, String traderPersonalName});
}

/// @nodoc
class _$TraderCopyWithImpl<$Res, $Val extends Trader>
    implements $TraderCopyWith<$Res> {
  _$TraderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? traderSurName = null,
    Object? traderPersonalName = null,
  }) {
    return _then(_value.copyWith(
      traderSurName: null == traderSurName
          ? _value.traderSurName
          : traderSurName // ignore: cast_nullable_to_non_nullable
              as String,
      traderPersonalName: null == traderPersonalName
          ? _value.traderPersonalName
          : traderPersonalName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TraderCopyWith<$Res> implements $TraderCopyWith<$Res> {
  factory _$$_TraderCopyWith(_$_Trader value, $Res Function(_$_Trader) then) =
      __$$_TraderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String traderSurName, String traderPersonalName});
}

/// @nodoc
class __$$_TraderCopyWithImpl<$Res>
    extends _$TraderCopyWithImpl<$Res, _$_Trader>
    implements _$$_TraderCopyWith<$Res> {
  __$$_TraderCopyWithImpl(_$_Trader _value, $Res Function(_$_Trader) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? traderSurName = null,
    Object? traderPersonalName = null,
  }) {
    return _then(_$_Trader(
      traderSurName: null == traderSurName
          ? _value.traderSurName
          : traderSurName // ignore: cast_nullable_to_non_nullable
              as String,
      traderPersonalName: null == traderPersonalName
          ? _value.traderPersonalName
          : traderPersonalName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Trader implements _Trader {
  const _$_Trader(
      {required this.traderSurName, required this.traderPersonalName});

  factory _$_Trader.fromJson(Map<String, dynamic> json) =>
      _$$_TraderFromJson(json);

  @override
  final String traderSurName;
  @override
  final String traderPersonalName;

  @override
  String toString() {
    return 'Trader(traderSurName: $traderSurName, traderPersonalName: $traderPersonalName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Trader &&
            (identical(other.traderSurName, traderSurName) ||
                other.traderSurName == traderSurName) &&
            (identical(other.traderPersonalName, traderPersonalName) ||
                other.traderPersonalName == traderPersonalName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, traderSurName, traderPersonalName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TraderCopyWith<_$_Trader> get copyWith =>
      __$$_TraderCopyWithImpl<_$_Trader>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TraderToJson(
      this,
    );
  }
}

abstract class _Trader implements Trader {
  const factory _Trader(
      {required final String traderSurName,
      required final String traderPersonalName}) = _$_Trader;

  factory _Trader.fromJson(Map<String, dynamic> json) = _$_Trader.fromJson;

  @override
  String get traderSurName;
  @override
  String get traderPersonalName;
  @override
  @JsonKey(ignore: true)
  _$$_TraderCopyWith<_$_Trader> get copyWith =>
      throw _privateConstructorUsedError;
}
