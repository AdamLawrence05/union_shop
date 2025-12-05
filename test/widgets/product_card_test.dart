import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/product_card.dart';

void main() {
  group('Product Card Widget Tests', () {
    Widget createProductCard({
      String title = 'Test Product',
      String price = '£10.00',
      String imageUrl = 'assets/images/EssentialShirt.png',
      String description = 'Test description',
      String type = 'clothing',
    }) {
      return MaterialApp(
        home: Scaffold(
          body: SizedBox(
            height: 300,
            width: 200,
            child: ProductCard(
              title: title,
              price: price,
              imageUrl: imageUrl,
              description: description,
              type: type,
            ),
          ),
        ),
        routes: {
          '/product': (context) => const Scaffold(body: Text('Product Page')),
        },
      );
    }

    testWidgets('displays product title', (tester) async {
      await tester.pumpWidget(createProductCard(title: 'Essential T-Shirt'));
      await tester.pump();

      expect(find.text('Essential T-Shirt'), findsOneWidget);
    });

    testWidgets('displays product price', (tester) async {
      await tester.pumpWidget(createProductCard(price: '£15.99'));
      await tester.pump();

      expect(find.text('£15.99'), findsOneWidget);
    });

    testWidgets('displays sale price format', (tester) async {
      await tester.pumpWidget(createProductCard(price: 'Was £20.00, Now £15.99'));
      await tester.pump();

      expect(find.text('Was £20.00, Now £15.99'), findsOneWidget);
    });

    testWidgets('card is tappable', (tester) async {
      await tester.pumpWidget(createProductCard());
      await tester.pump();

      // Verify it's wrapped in a GestureDetector
      expect(find.byType(GestureDetector), findsOneWidget);
    });

    testWidgets('tapping card navigates to product page', (tester) async {
      await tester.pumpWidget(createProductCard());
      await tester.pump();

      await tester.tap(find.byType(ProductCard));
      await tester.pumpAndSettle();

      expect(find.text('Product Page'), findsOneWidget);
    });

    testWidgets('displays different product titles', (tester) async {
      await tester.pumpWidget(createProductCard(title: 'Signature Water Bottle'));
      await tester.pump();

      expect(find.text('Signature Water Bottle'), findsOneWidget);
    });

    testWidgets('displays merchandise type product', (tester) async {
      await tester.pumpWidget(createProductCard(
        title: 'University Mug',
        price: '£4.50',
        type: 'merchandise',
      ));
      await tester.pump();

      expect(find.text('University Mug'), findsOneWidget);
      expect(find.text('£4.50'), findsOneWidget);
    });
  });
}