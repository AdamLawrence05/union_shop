import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/collections.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/collection_card.dart';

void main() {
  group('Collections Page Tests', () {
    Widget createCollectionsPage() {
      return MaterialApp(
        home: const CollectionsPage(),
        routes: {
          '/collection': (context) => const Scaffold(body: Text('Collection')),
          '/login': (context) => const Scaffold(body: Text('Login')),
          '/collections': (context) => const Scaffold(body: Text('Collections')),
        },
      );
    }

    testWidgets('displays Collections title', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createCollectionsPage());
      await tester.pump();

      expect(find.text('Collections'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Clothing collection', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createCollectionsPage());
      await tester.pump();

      expect(find.text('Clothing'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Merchandise collection', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createCollectionsPage());
      await tester.pump();

      expect(find.text('Merchandise'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays SALE! collection', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createCollectionsPage());
      await tester.pump();

      expect(find.text('SALE!'), findsAtLeast(1));

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Essentials collection', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createCollectionsPage());
      await tester.pump();

      expect(find.text('Essentials'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays 4 collection cards', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createCollectionsPage());
      await tester.pump();

      expect(find.byType(CollectionCard), findsNWidgets(4));

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('has navbar', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createCollectionsPage());
      await tester.pump();

      expect(find.byType(Navbar), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('has footer', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createCollectionsPage());
      await tester.pump();

      expect(find.byType(Footer), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });
  });
}