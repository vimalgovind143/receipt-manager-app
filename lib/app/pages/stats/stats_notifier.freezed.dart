// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StatsState {
  List<ReceiptHolder> get receipts => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of StatsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatsStateCopyWith<StatsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsStateCopyWith<$Res> {
  factory $StatsStateCopyWith(
          StatsState value, $Res Function(StatsState) then) =
      _$StatsStateCopyWithImpl<$Res, StatsState>;
  @useResult
  $Res call({List<ReceiptHolder> receipts, bool isLoading});
}

/// @nodoc
class _$StatsStateCopyWithImpl<$Res, $Val extends StatsState>
    implements $StatsStateCopyWith<$Res> {
  _$StatsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receipts = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      receipts: null == receipts
          ? _value.receipts
          : receipts // ignore: cast_nullable_to_non_nullable
              as List<ReceiptHolder>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatsStateImplCopyWith<$Res>
    implements $StatsStateCopyWith<$Res> {
  factory _$$StatsStateImplCopyWith(
          _$StatsStateImpl value, $Res Function(_$StatsStateImpl) then) =
      __$$StatsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReceiptHolder> receipts, bool isLoading});
}

/// @nodoc
class __$$StatsStateImplCopyWithImpl<$Res>
    extends _$StatsStateCopyWithImpl<$Res, _$StatsStateImpl>
    implements _$$StatsStateImplCopyWith<$Res> {
  __$$StatsStateImplCopyWithImpl(
      _$StatsStateImpl _value, $Res Function(_$StatsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receipts = null,
    Object? isLoading = null,
  }) {
    return _then(_$StatsStateImpl(
      receipts: null == receipts
          ? _value._receipts
          : receipts // ignore: cast_nullable_to_non_nullable
              as List<ReceiptHolder>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StatsStateImpl implements _StatsState {
  const _$StatsStateImpl(
      {final List<ReceiptHolder> receipts = const [], this.isLoading = false})
      : _receipts = receipts;

  final List<ReceiptHolder> _receipts;
  @override
  @JsonKey()
  List<ReceiptHolder> get receipts {
    if (_receipts is EqualUnmodifiableListView) return _receipts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_receipts);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'StatsState(receipts: $receipts, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsStateImpl &&
            const DeepCollectionEquality().equals(other._receipts, _receipts) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_receipts), isLoading);

  /// Create a copy of StatsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsStateImplCopyWith<_$StatsStateImpl> get copyWith =>
      __$$StatsStateImplCopyWithImpl<_$StatsStateImpl>(this, _$identity);
}

abstract class _StatsState implements StatsState {
  const factory _StatsState(
      {final List<ReceiptHolder> receipts,
      final bool isLoading}) = _$StatsStateImpl;

  @override
  List<ReceiptHolder> get receipts;
  @override
  bool get isLoading;

  /// Create a copy of StatsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatsStateImplCopyWith<_$StatsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
