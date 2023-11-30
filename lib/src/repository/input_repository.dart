import 'package:caculator_tdd/src/features/calculators.dart';
import 'package:caculator_tdd/src/features/custom_failure.dart';
import 'package:caculator_tdd/src/models/operand.dart';
import 'package:caculator_tdd/src/models/user_input.dart';
import 'package:fpdart/fpdart.dart';

class InputRepository {
  (Operand operand, String operatorString) getOperand(final UserInput userInput) {
    final input = userInput.input!.split(' ');
    final left = double.tryParse(input.first);
    final right = double.tryParse(input.last);
    return (Operand(left: left!, right: right!), input[1]);
  }

  Either<CustomFailure, Calulators> getOperatorClass(final String operator) {
    try {
      final opeartorClass = Calulators.getOperators(operator);
      return Right(opeartorClass);
    } catch (e) {
      return Left(CustomFailure(e.toString()));
    }
  }
}
