import 'package:caculator_tdd/src/features/custom_failure.dart';
import 'package:caculator_tdd/src/models/answer.dart';
import 'package:caculator_tdd/src/models/operand.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Calulators {
  factory Calulators.add() => Add();

  factory Calulators.sub() => Sub();

  factory Calulators.mul() => Mul();

  factory Calulators.div() => Div();

  factory Calulators.getOperators(final String operator) => switch (operator) {
        '+' => Calulators.add(),
        '-' => Calulators.sub(),
        '*' => Calulators.mul(),
        '/' => Calulators.div(),
        _ => throw Exception('invalid operator'),
      };

  Either<CustomFailure, Answer> calulate(final Operand operand);
}

class Add implements Calulators {
  @override
  Either<CustomFailure, Answer> calulate(final Operand operand) => Right(Answer(operand.left + operand.right));
}

class Sub implements Calulators {
  @override
  Either<CustomFailure, Answer> calulate(final Operand operand) => Right(Answer(operand.left - operand.right));
}

class Mul implements Calulators {
  @override
  Either<CustomFailure, Answer> calulate(final Operand operand) => Right(Answer(operand.left * operand.right));
}

class Div implements Calulators {
  @override
  Either<CustomFailure, Answer> calulate(final Operand operand) => operand.right == 0
      ? const Left(
          CustomFailure('Cannot divide by zero'),
        )
      : Right(
          Answer(operand.left / operand.right),
        );
}
