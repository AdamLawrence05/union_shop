import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/print_shack_about.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';

void main() {
  group('Print Shack About Page Tests', () {
    Widget createPrintShackAboutPage() {
      return MaterialApp(
        home: const PrintShackAboutPage(),
        routes: {
          '/collection': (context) => const Scaffold(body: Text('Collection')),
          '/login': (context) => const Scaffold(body: Text('Login')),
          '/collections': (context) => const Scaffold(body: Text('Collections')),
        },
      );
    }

    testWidgets('displays About The Print Shack title', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackAboutPage());
      await tester.pump();

      expect(find.text('About The Print Shack'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays PERSONALISATION heading', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackAboutPage());
      await tester.pump();

      expect(find.text('PERSONALISATION'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays personalisation description', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackAboutPage());
      await tester.pump();

      expect(find.textContaining('Make it yours!'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Pricing heading', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackAboutPage());
      await tester.pump();

      expect(find.text('Pricing'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays pricing information', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackAboutPage());
      await tester.pump();

      expect(find.textContaining('£3 for a line'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('has navbar', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackAboutPage());
      await tester.pump();

      expect(find.byType(Navbar), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('has footer', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createPrintShackAboutPage());
      await tester.pump();

      expect(find.byType(Footer), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });
  });
}