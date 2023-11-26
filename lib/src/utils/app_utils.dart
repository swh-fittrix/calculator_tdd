import 'dart:io';

import 'package:caculator_tdd/src/core/usecases/usecase.dart';
import 'package:caculator_tdd/src/features/calculate.dart';
import 'package:caculator_tdd/src/features/calculate_abstract.dart';
import 'package:caculator_tdd/src/models/user_input.dart';
import 'package:fpdart/fpdart.dart';

class AppUtils {
  AppUtils._();

  static Either<String, UserInput> parseInput(final String? input) {
    const s = 'input is not valid';

    if (input == null) {
      return const Left(s);
    }

    final splitInput = input.split(' ');

    if (splitInput.length != 3) {
      return const Left(s);
    }

    final left = double.tryParse(splitInput[0]);
    final right = double.tryParse(splitInput[2]);
    if (left == null || right == null) {
      return const Left(s);
    }

    final operation = AppUtils.getOperation(splitInput[1]);

    return operation.match(
      Left.new,
      (final r) => Right(UserInput(left: left, operation: r, right: right)),
    );
  }

  static void print(final String message) {
    stdout.writeln(message);
  }

  static void infinityRoop() {
    AppUtils.weblcomePrint();

    String? input;

    while (true) {
      stdout.writeln('\n계산하실 내용을 입력해주세요.');

      input = stdin.readLineSync();
      if (input == 'q') {
        AppUtils.goodByePrint();
      }

      UseCases().requestCalculate(input).match(
            AppUtils.print,
            (final r) => AppUtils.print('결과는 ${r.result} 입니다.'),
          );
    }
  }

  static void goodByePrint() {
    stdout.writeln('안녕히 가세요.');
    exit(0);
  }

  static void weblcomePrint() {
    stdout
      ..writeln('CLI 형 사칙연산 계산기 입니다.')
      ..writeln('<숫자><공백><연산자><공백><숫자> 형식으로 입력해주세요.')
      ..writeln('ex) 99.99 + 11.11')
      ..writeln('q 키를 입력하시면 종료됩니다.');
  }

  static Either<String, Calulate> getOperation(final String operation) => switch (operation) {
        '+' => Right(Add()),
        '-' => Right(Sub()),
        '*' => Right(Mul()),
        '/' => Right(Div()),
        _ => const Left('operation is not valid'),
      };
}
