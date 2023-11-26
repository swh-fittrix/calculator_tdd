import 'package:caculator_tdd/src/features/calculate_abstract.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_input.freezed.dart';

@freezed
class UserInput with _$UserInput {
  const factory UserInput({
    required final double left,
    required final Calulate operation,
    required final double right,
  }) = _UserInput;
}
