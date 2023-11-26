import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result with _$Result {
  const factory Result({
    required final double left,
    required final double right,
    final double? result,
  }) = _Result;
}
