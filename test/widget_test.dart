// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:flutter_wisata_candi_2627_51/main.dart';
import 'package:flutter_wisata_candi_2627_51/models/candi.dart';
import 'package:flutter_wisata_candi_2627_51/providers/auth_provider.dart';
import 'package:flutter_wisata_candi_2627_51/providers/favorite_provider.dart';
import 'package:flutter_wisata_candi_2627_51/widgets/item_card.dart';

Widget createTestApp({Widget? home}) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ChangeNotifierProvider(create: (_) => AuthProvider()),
    ],
    child: MaterialApp(home: home ?? const MyApp()),
  );
}

void main() {
  testWidgets('Home screen displays temples in a grid', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestApp());

    expect(find.text('Wisata Candi'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
    expect(find.text('Candi Borobudur'), findsOneWidget);
    expect(find.text('Candi Mendut'), findsOneWidget);
  });

  testWidgets('Selecting a temple opens its detail screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      createTestApp(
        home: Scaffold(
          body: ItemCard(
            candi: Candi(
              name: 'Candi Uji',
              location: 'Magelang',
              description: 'Deskripsi uji',
              built: 'Abad ke-9',
              type: 'Candi Buddha',
              imageAsset: 'images/borobudur.jpeg',
              imageUrls: [],
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Candi Uji'));
    await tester.pumpAndSettle();

    expect(find.text('Deskripsi'), findsOneWidget);
    expect(find.text('Galeri'), findsOneWidget);
  });
}
