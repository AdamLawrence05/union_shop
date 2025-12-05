import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/navbar.dart';

void main() {
  group('Navbar Widget Tests', () {
    Widget createNavbar() {
      return MaterialApp(
        home: const Scaffold(
          body: Navbar(),
        ),
        routes: {
          '/about': (context) => const Scaffold(body: Text('About')),
          '/login': (context) => const Scaffold(body: Text('Login')),
          '/collection': (context) => const Scaffold(body: Text('Collection')),
          '/collections': (context) => const Scaffold(body: Text('Collections')),
          '/print-shack': (context) => const Scaffold(body: Text('Print Shack')),
          '/print-shack-about': (context) => const Scaffold(body: Text('Print Shack About')),
        },
      );
    }

    testWidgets('displays sale banner', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createNavbar());
      await tester.pump();

      expect(find.textContaining('BIG SALE!'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Home button on desktop', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createNavbar());
      await tester.pump();

      expect(find.text('Home'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Shops dropdown on desktop', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createNavbar());
      await tester.pump();

      expect(find.text('Shops'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays The Print Shack dropdown on desktop', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createNavbar());
      await tester.pump();

      expect(find.text('The Print Shack'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays SALE! button on desktop', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createNavbar());
      await tester.pump();

      expect(find.text('SALE!'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays About us button on desktop', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createNavbar());
      await tester.pump();

      expect(find.text('About us'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays search icon', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createNavbar());
      await tester.pump();

      expect(find.byIcon(Icons.search), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays person/login icon', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createNavbar());
      await tester.pump();

      expect(find.byIcon(Icons.person_outline), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays shopping bag icon', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createNavbar());
      await tester.pump();

      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays menu icon on mobile', (tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createNavbar());
      await tester.pump();

      expect(find.byIcon(Icons.menu), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('hides desktop nav items on mobile', (tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createNavbar());
      await tester.pump();

      // These should not be visible on mobile
      expect(find.text('Home'), findsNothing);
      expect(find.text('Shops'), findsNothing);
      expect(find.text('About us'), findsNothing);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('login icon navigates to login page', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createNavbar());
      await tester.pump();

      await tester.tap(find.byIcon(Icons.person_outline));
      await tester.pumpAndSettle();

      expect(find.text('Login'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });
  });
}