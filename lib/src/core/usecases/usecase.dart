import 'package:caculator_tdd/src/models/result.dart';
import 'package:caculator_tdd/src/utils/app_utils.dart';
import 'package:fpdart/fpdart.dart';

class UseCases {
  UseCases();

  Either<String, Result> requestCalculate(final String? input) => AppUtils.parseInput(input).match(
        Left.new,
        (final r) => r.operation.calulate(
          Result(left: r.left, right: r.right),
        ),
      );
}
