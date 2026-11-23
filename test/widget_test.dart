// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_wisata_candi_2627_51/main.dart';

void main() {
  testWidgets('Search screen lists and filters temples', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Pencarian Candi'), findsOneWidget);
    expect(find.text('Candi Borobudur'), findsOneWidget);
    expect(find.text('Candi Mendut'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'prambanan');
    await tester.pumpAndSettle();

    expect(find.text('Candi Prambanan'), findsOneWidget);
    expect(find.text('Candi Borobudur'), findsNothing);
  });
}
