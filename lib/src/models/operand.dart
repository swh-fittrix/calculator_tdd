import 'package:caculator_tdd/src/features/calculators.dart';
import 'package:caculator_tdd/src/features/custom_failure.dart';
import 'package:caculator_tdd/src/features/custom_success.dart';
import 'package:fpdart/fpdart.dart';

class Operand {
  const Operand({
    required this.left,
    required this.right,
  });

  final double left;
  final double right;

  Either<CustomFailure, CustomSuccess> runCalculate(final Calulators calculator) => calculator.calulate(this).match(
        Left.new,
        (final answer) => Right(
          CustomSuccess('result: ${answer.value}'),
        ),
      );
}
