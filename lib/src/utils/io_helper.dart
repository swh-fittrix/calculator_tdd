import 'dart:io';

import 'package:caculator_tdd/src/models/user_input.dart';

class IoHelper {
  const IoHelper._();

  static void print(final String message) => stdout.writeln(message);

  static void weblcomePrint() => stdout
    ..writeln('CLI 형 사칙연산 계산기 입니다.')
    ..writeln('<숫자><공백><연산자><공백><숫자> 형식으로 입력해주세요.')
    ..writeln('ex) 99.99 + 11.11')
    ..writeln('q 키를 입력하시면 종료됩니다.');

  static void askInput() => stdout.writeln('\n계산하실 내용을 입력해주세요.');

  static UserInput readInput() {
    final input = stdin.readLineSync();
    if (_isExitCode(input)) {
      _goodByePrint();
    }

    return UserInput(input);
  }

  static bool _isExitCode(final String? input) => input?.trim() == 'q';

  static void _goodByePrint() {
    stdout.writeln('안녕히 가세요.');
    exit(0);
  }
}
