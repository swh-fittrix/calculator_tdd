import 'package:caculator_tdd/src/models/result.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Calulate {
  Either<String, Result> calulate(Result result);
}
