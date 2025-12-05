import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/print_shack.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';

void main() {
  group('Print Shack Page Tests', () {
    Widget createPrintShackPage() {
      return MaterialApp(
        home: const PrintShackPage(),
        routes: {
          '/collection': (context) => const Scaffold(body: Text('Collection')),
          '/login': (context) => const Scaffold(body: Text('Login')),
          '/collections': (context) => const Scaffold(body: Text('Collections')),
        },
      );
    }

    testWidgets('displays Print Shack title', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackPage());
      await tester.pump();

      expect(find.text('Print Shack'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays default price', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackPage());
      await tester.pump();

      expect(find.text('£3.00'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Print Option dropdown', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackPage());
      await tester.pump();

      expect(find.text('Print Option:'), findsOneWidget);
      expect(find.text('One line of text'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays custom text input', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackPage());
      await tester.pump();

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Enter your custom text here...'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Quantity label', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackPage());
      await tester.pump();

      expect(find.text('Quantity:'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Add to Cart button', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackPage());
      await tester.pump();

      expect(find.text('ADD TO CART'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('quantity starts at 1', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackPage());
      await tester.pump();

      expect(find.text('1'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('increment button increases quantity', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackPage());
      await tester.pump();

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('2'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('decrement button decreases quantity', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackPage());
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

      await tester.pumpWidget(createPrintShackPage());
      await tester.pump();

      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('changing print option updates price', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackPage());
      await tester.pump();

      // Default price is £3.00
      expect(find.text('£3.00'), findsOneWidget);

      // Open dropdown
      await tester.tap(find.text('One line of text'));
      await tester.pump();

      // Select 'Two lines of text' (£5.00)
      await tester.tap(find.text('Two lines of text').last);
      await tester.pump();

      // Price should update
      expect(find.text('£5.00'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('has navbar', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackPage());
      await tester.pump();

      expect(find.byType(Navbar), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('has footer', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackPage());
      await tester.pump();

      expect(find.byType(Footer), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });
  });
}