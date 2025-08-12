import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore_for_file: avoid_relative_lib_imports
// Import example app relatively since it's part of this mono-repo
import '../../example/lib/main.dart' as example;

void main() {
  testWidgets('Example app shows a visible palette panel', (tester) async {
    await tester.pumpWidget(const example.MyApp());
    await tester.pumpAndSettle();

    // Palette container should be present
    expect(find.byKey(const ValueKey('example_palette')), findsOneWidget);

    // Ensure it is laid out with non-zero size
    final renderBox =
        tester.renderObject(find.byKey(const ValueKey('example_palette')));
    expect(renderBox, isA<RenderBox>());
    final size = (renderBox as RenderBox).size;
    expect(size.width, greaterThan(50));
    expect(size.height, greaterThan(50));
  });
}
