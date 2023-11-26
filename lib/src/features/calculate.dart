import 'package:caculator_tdd/src/features/calculate_abstract.dart';
import 'package:caculator_tdd/src/models/result.dart';
import 'package:fpdart/fpdart.dart';

class Add implements Calulate {
  @override
  Either<String, Result> calulate(final Result result) => Right(result.copyWith(result: result.left + result.right));
}

class Sub implements Calulate {
  @override
  Either<String, Result> calulate(final Result result) => Right(result.copyWith(result: result.left - result.right));
}

class Mul implements Calulate {
  @override
  Either<String, Result> calulate(final Result result) => Right(result.copyWith(result: result.left * result.right));
}

class Div implements Calulate {
  @override
  Either<String, Result> calulate(final Result result) => switch (result) {
        _ when result.right == 0 => const Left('Cannot divide by zero'),
        _ => Right(result.copyWith(result: result.left / result.right)),
      };
}
