import 'package:caculator_tdd/src/features/custom_failure.dart';
import 'package:caculator_tdd/src/models/user_input.dart';
import 'package:fpdart/fpdart.dart';

class FormatChecker {
  const FormatChecker._();

  static Option<CustomFailure> formatValidate(final UserInput userinput) {
    if (_isNull(userinput.input)) {
      return const Option.of(CustomFailure('input is null'));
    }

    final input = userinput.input!.split(' ');

    if (_isInputNotValid(input)) {
      return const Option.of(CustomFailure('input is invalid'));
    }

    if (_isNumberNotValid(input)) {
      return const Option.of(CustomFailure('either left or right is not a number'));
    }

    return const Option.none();
  }

  static bool _isNull<T>(final T input) => input == null;

  static bool _isInputNotValid(final List<String> input) => input.length != 3;

  static bool _isNumberNotValid(final List<String> input) {
    final left = double.tryParse(input.first);
    final right = double.tryParse(input.last);
    return left == null || right == null;
  }
}
