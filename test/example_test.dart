import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockExample extends Mock {}

void main() {
  test('example test', () {
    final mock = MockExample();
    expect(mock, isA<MockExample>());
  });
}
