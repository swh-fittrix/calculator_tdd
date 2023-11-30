import 'package:caculator_tdd/src/models/user_input.dart';
import 'package:caculator_tdd/src/repository/input_repository.dart';
import 'package:caculator_tdd/src/utils/format_checker.dart';

class UseCases {
  UseCases();

  static String requestCalculate(final UserInput userInput) {
    final formatValidate = FormatChecker.formatValidate(userInput);
    if (formatValidate.isSome()) {
      return formatValidate.fold(
        () => '',
        (final formatValidationFail) => formatValidationFail.expectionMessage,
      );
    }

    final inputRepository = InputRepository();
    final (operand, operatorString) = inputRepository.getOperand(userInput);
    final operatorClass = inputRepository.getOperatorClass(operatorString);

    return operatorClass.fold(
      (final opeartorNotValid) => opeartorNotValid.expectionMessage,
      (final operatorClass) => operand.runCalculate(operatorClass).fold(
            (final operatingFail) => operatingFail.expectionMessage,
            (final operatingSuccess) => operatingSuccess.successMessage,
          ),
    );
  }
}
