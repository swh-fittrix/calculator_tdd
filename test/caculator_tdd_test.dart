// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:caculator_tdd/src/core/usecases/usecase.dart';
import 'package:caculator_tdd/src/features/calculate.dart';
import 'package:caculator_tdd/src/models/result.dart';
import 'package:caculator_tdd/src/models/user_input.dart';
import 'package:caculator_tdd/src/utils/app_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

void main() {
  group('사칙연산', () {
    test('더하기', () {
      final add = Add().calulate(const Result(left: 3, right: 0));
      expect(add, const Right(Result(left: 3, right: 0, result: 3)));
    });

    test('빼기', () {
      final sub = Sub().calulate(const Result(left: 3, right: 0));
      expect(sub, const Right(Result(left: 3, right: 0, result: 3)));
    });

    test('곱하기', () {
      final mul = Mul().calulate(const Result(left: 3, right: 0));
      expect(mul, const Right(Result(left: 3, right: 0, result: 0)));
    });

    test('나누기 에러', () {
      final div = Div().calulate(const Result(left: 3, right: 0));
      expect(div, const Left('Cannot divide by zero'));
    });

    test('나누기', () {
      final div = Div().calulate(const Result(left: 3, right: 1));
      expect(div, const Right(Result(left: 3, right: 1, result: 3)));
    });
  });

  group(
    '입력 값 변환',
    () {
      test(
        '성공',
        () {
          const input = '99.99 + 11.11';
          final answer = AppUtils.parseInput(input);
          final right = answer.match((l) => null, (r) => r);

          expect(answer.isRight(), true);
          expect(right, isA<UserInput>());
        },
      );

      test(
        '실패',
        () {
          const input = '99.99 + 11.11 + 11.11';
          final answer = AppUtils.parseInput(input);
          expect(answer, const Left('input is not valid'));

          const String? input2 = null;
          final answer2 = AppUtils.parseInput(input2);
          expect(answer2, const Left('input is not valid'));
        },
      );
    },
  );

  group(
    '연산자 얻기',
    () {
      test(
        '덧셈',
        () {
          final operation = AppUtils.getOperation('+');
          final right = operation.match((l) => null, (r) => r);
          expect(operation.isRight(), true);
          expect(right, isA<Add>());
        },
      );

      test(
        '뺄셈',
        () {
          final operation = AppUtils.getOperation('-');
          final right = operation.match((l) => null, (r) => r);
          expect(operation.isRight(), true);
          expect(right, isA<Sub>());
        },
      );

      test(
        '곱셈',
        () {
          final operation = AppUtils.getOperation('*');
          final right = operation.match((l) => null, (r) => r);
          expect(operation.isRight(), true);
          expect(right, isA<Mul>());
        },
      );

      test(
        '나눗셈',
        () {
          final operation = AppUtils.getOperation('/');
          final right = operation.match((l) => null, (r) => r);
          expect(operation.isRight(), true);
          expect(right, isA<Div>());
        },
      );

      test(
        '실패',
        () {
          final operation = AppUtils.getOperation('a');
          expect(operation, const Left('operation is not valid'));
        },
      );
    },
  );

  group(
    '유즈케이스를 이용한 나누기',
    () {
      test('나누기 에러', () {
        final div = UseCases().requestCalculate('3 / 0');
        expect(div, const Left('Cannot divide by zero'));
      });

      test('나누기', () {
        final div = UseCases().requestCalculate('99.99 / 11.11');
        expect(div, const Right(Result(left: 99.99, right: 11.11, result: 9)));
      });
    },
  );
}
