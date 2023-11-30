import 'package:caculator_tdd/src/core/usecases/usecase.dart';
import 'package:caculator_tdd/src/utils/io_helper.dart';

void main() {
  IoHelper.weblcomePrint();

  while (true) {
    IoHelper.askInput();

    final userInput = IoHelper.readInput();
    final resultString = UseCases.requestCalculate(userInput);

    IoHelper.print(resultString);
  }
}
