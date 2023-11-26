// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserInput {
  double get left => throw _privateConstructorUsedError;
  Calulate get operation => throw _privateConstructorUsedError;
  double get right => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserInputCopyWith<UserInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInputCopyWith<$Res> {
  factory $UserInputCopyWith(UserInput value, $Res Function(UserInput) then) =
      _$UserInputCopyWithImpl<$Res, UserInput>;
  @useResult
  $Res call({double left, Calulate operation, double right});
}

/// @nodoc
class _$UserInputCopyWithImpl<$Res, $Val extends UserInput>
    implements $UserInputCopyWith<$Res> {
  _$UserInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? left = null,
    Object? operation = null,
    Object? right = null,
  }) {
    return _then(_value.copyWith(
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as double,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as Calulate,
      right: null == right
          ? _value.right
          : right // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInputImplCopyWith<$Res>
    implements $UserInputCopyWith<$Res> {
  factory _$$UserInputImplCopyWith(
          _$UserInputImpl value, $Res Function(_$UserInputImpl) then) =
      __$$UserInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double left, Calulate operation, double right});
}

/// @nodoc
class __$$UserInputImplCopyWithImpl<$Res>
    extends _$UserInputCopyWithImpl<$Res, _$UserInputImpl>
    implements _$$UserInputImplCopyWith<$Res> {
  __$$UserInputImplCopyWithImpl(
      _$UserInputImpl _value, $Res Function(_$UserInputImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? left = null,
    Object? operation = null,
    Object? right = null,
  }) {
    return _then(_$UserInputImpl(
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as double,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as Calulate,
      right: null == right
          ? _value.right
          : right // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$UserInputImpl implements _UserInput {
  const _$UserInputImpl(
      {required this.left, required this.operation, required this.right});

  @override
  final double left;
  @override
  final Calulate operation;
  @override
  final double right;

  @override
  String toString() {
    return 'UserInput(left: $left, operation: $operation, right: $right)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInputImpl &&
            (identical(other.left, left) || other.left == left) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.right, right) || other.right == right));
  }

  @override
  int get hashCode => Object.hash(runtimeType, left, operation, right);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInputImplCopyWith<_$UserInputImpl> get copyWith =>
      __$$UserInputImplCopyWithImpl<_$UserInputImpl>(this, _$identity);
}

abstract class _UserInput implements UserInput {
  const factory _UserInput(
      {required final double left,
      required final Calulate operation,
      required final double right}) = _$UserInputImpl;

  @override
  double get left;
  @override
  Calulate get operation;
  @override
  double get right;
  @override
  @JsonKey(ignore: true)
  _$$UserInputImplCopyWith<_$UserInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
