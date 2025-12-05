import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/product_page.dart';

void main() {
  group('Product Page Widget Tests', () {
    Widget createProductPage({Map<String, dynamic>? args}) {
      return MaterialApp(
        home: Builder(
          builder: (context) {
            return const ProductPage();
          },
        ),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            settings: RouteSettings(arguments: args),
            builder: (context) => const ProductPage(),
          );
        },
      );
    }

    testWidgets('displays default placeholder when no arguments provided', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createProductPage());
      await tester.pump();

      expect(find.text('Placeholder Product Name'), findsOneWidget);
      expect(find.text('£0.00'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Add to Cart button', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createProductPage());
      await tester.pump();

      expect(find.text('ADD TO CART'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Quantity label', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createProductPage());
      await tester.pump();

      expect(find.text('Quantity:'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Description section', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createProductPage());
      await tester.pump();

      expect(find.text('Description'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('quantity starts at 1', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createProductPage());
      await tester.pump();

      expect(find.text('1'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('increment button increases quantity', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createProductPage());
      await tester.pump();

      final addButton = find.byIcon(Icons.add);
      expect(addButton, findsOneWidget);
      
      await tester.tap(addButton);
      await tester.pump();

      expect(find.text('2'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('decrement button decreases quantity', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createProductPage());
      await tester.pump();

      // First increment to 2
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('2'), findsOneWidget);

      // Then decrement back to 1
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('quantity cannot go below 1', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createProductPage());
      await tester.pump();

      // Try to decrement when quantity is 1
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      // Should still be 1
      expect(find.text('1'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('has remove and add icons for quantity', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createProductPage());
      await tester.pump();

      expect(find.byIcon(Icons.remove), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });
  });
}