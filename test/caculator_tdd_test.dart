// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:caculator_tdd/src/core/usecases/usecase.dart';
import 'package:caculator_tdd/src/features/calculators.dart';
import 'package:caculator_tdd/src/features/custom_failure.dart';
import 'package:caculator_tdd/src/models/answer.dart';
import 'package:caculator_tdd/src/models/operand.dart';
import 'package:caculator_tdd/src/models/user_input.dart';
import 'package:caculator_tdd/src/repository/input_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

void main() {
  group('사칙연산', () {
    test('덧셈', () {
      final add = Calulators.add().calulate(const Operand(left: 1, right: 2));
      final answer = add.getOrElse((l) => const Answer(0));
      expect(answer.value, 3);
    });

    test('뺄셈', () {
      final sub = Calulators.sub().calulate(const Operand(left: 1, right: 2));
      final answer = sub.getOrElse((l) => const Answer(0));
      expect(answer.value, -1);
    });

    test('곱셈', () {
      final mul = Calulators.mul().calulate(const Operand(left: 1, right: 2));
      final answer = mul.getOrElse((l) => const Answer(0));
      expect(answer.value, 2);
    });

    test('나눗셈', () {
      final div = Calulators.div().calulate(const Operand(left: 1, right: 2));
      final answer = div.getOrElse((l) => const Answer(0));
      expect(answer.value, 0.5);
    });

    test('나누기 에러', () {
      final div = Calulators.div().calulate(const Operand(left: 1, right: 0));
      final answer = div.fold((l) => l, (r) => r);
      expect(answer, const CustomFailure('Cannot divide by zero'));
    });
  });

  group(
    '입력 값 변환',
    () {
      InputRepository repository = InputRepository();

      test(
        '성공',
        () {
          final (operand, operatorString) = repository.getOperand(UserInput('1 + 2'));
          expect(operand.left, 1);
          expect(operand.right, 2);
          expect(operatorString, '+');
        },
      );

      test(
        '실패',
        () {
          final operatorClass = repository.getOperatorClass('a');
          expect(operatorClass, isA<Left<CustomFailure, Calulators>>());
        },
      );
    },
  );

  group(
    '유즈케이스를 이용한 나누기',
    () {
      test('나누기 에러', () {
        final userInput = UserInput('1 / 0');
        final result = UseCases.requestCalculate(userInput);
        expect(result, 'Cannot divide by zero');
      });

      test('나누기', () {
        final userInput = UserInput('1 / 2');
        final result = UseCases.requestCalculate(userInput);
        expect(result, 'result: 0.5');
      });
    },
  );
}
