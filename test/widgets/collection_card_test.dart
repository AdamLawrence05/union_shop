import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/collection_card.dart';

void main() {
  group('Collection Card Widget Tests', () {
    Widget createCollectionCard({
      String title = 'Test Collection',
      String imageUrl = 'assets/images/EssentialShirt.png',
    }) {
      return MaterialApp(
        home: Scaffold(
          body: SizedBox(
            height: 200,
            width: 200,
            child: CollectionCard(
              title: title,
              imageUrl: imageUrl,
            ),
          ),
        ),
        routes: {
          '/collection': (context) => const Scaffold(body: Text('Collection Page')),
        },
      );
    }

    testWidgets('displays collection title', (tester) async {
      await tester.pumpWidget(createCollectionCard(title: 'Clothing'));
      await tester.pump();

      expect(find.text('Clothing'), findsOneWidget);
    });

    testWidgets('displays Merchandise collection', (tester) async {
      await tester.pumpWidget(createCollectionCard(title: 'Merchandise'));
      await tester.pump();

      expect(find.text('Merchandise'), findsOneWidget);
    });

    testWidgets('displays SALE! collection', (tester) async {
      await tester.pumpWidget(createCollectionCard(title: 'SALE!'));
      await tester.pump();

      expect(find.text('SALE!'), findsOneWidget);
    });

    testWidgets('displays Essentials collection', (tester) async {
      await tester.pumpWidget(createCollectionCard(title: 'Essentials'));
      await tester.pump();

      expect(find.text('Essentials'), findsOneWidget);
    });

    testWidgets('card is tappable', (tester) async {
      await tester.pumpWidget(createCollectionCard());
      await tester.pump();

      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('tapping card navigates to collection page', (tester) async {
      await tester.pumpWidget(createCollectionCard(title: 'Clothing'));
      await tester.pump();

      await tester.tap(find.byType(CollectionCard));
      await tester.pumpAndSettle();

      expect(find.text('Collection Page'), findsOneWidget);
    });

    testWidgets('uses Stack for overlay layout', (tester) async {
      await tester.pumpWidget(createCollectionCard());
      await tester.pump();

      expect(find.byType(Stack), findsAtLeast(1));
    });

    testWidgets('title text is white', (tester) async {
      await tester.pumpWidget(createCollectionCard(title: 'Clothing'));
      await tester.pump();

      final textWidget = tester.widget<Text>(find.text('Clothing'));
      expect(textWidget.style?.color, Colors.white);
    });
  });
}