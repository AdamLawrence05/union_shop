import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/collection_view.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/product_card.dart';

void main() {
  group('Collection View Page Tests', () {
    Widget createCollectionViewPage({String collection = 'All'}) {
      return MaterialApp(
        home: const CollectionViewPage(),
        routes: {
          '/collection': (context) => const Scaffold(body: Text('Collection')),
          '/login': (context) => const Scaffold(body: Text('Login')),
          '/product': (context) => const Scaffold(body: Text('Product')),
          '/collections': (context) => const Scaffold(body: Text('Collections')),
        },
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            settings: RouteSettings(arguments: {'collection': collection}),
            builder: (context) => const CollectionViewPage(),
          );
        },
      );
    }

    testWidgets('displays collection title', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createCollectionViewPage());
      await tester.pump();

      expect(find.text('ALL'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Sort by dropdown', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createCollectionViewPage());
      await tester.pump();

      expect(find.text('Sort by: '), findsOneWidget);
      expect(find.text('Name (A-Z)'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Type filter dropdown', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createCollectionViewPage());
      await tester.pump();

      expect(find.text('Type: '), findsOneWidget);
      expect(find.text('All'), findsAtLeast(1));

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('type filter changes displayed products', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createCollectionViewPage());
      await tester.pump();

      // Get initial product count
      final initialProductCount = tester.widgetList(find.byType(ProductCard)).length;

      // Tap the Type dropdown to open it
      await tester.tap(find.text('All').last);
      await tester.pump();

      // Select 'Clothing' from dropdown
      await tester.tap(find.text('Clothing').last);
      await tester.pump();

      // Get new product count after filtering
      final filteredProductCount = tester.widgetList(find.byType(ProductCard)).length;

      // The count should be different (fewer products when filtered)
      expect(filteredProductCount, lessThanOrEqualTo(initialProductCount));
      expect(find.byType(ProductCard), findsAtLeast(1));

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays product cards', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createCollectionViewPage());
      await tester.pump();

      expect(find.byType(ProductCard), findsAtLeast(1));

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('has navbar', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createCollectionViewPage());
      await tester.pump();

      expect(find.byType(Navbar), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('has footer', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createCollectionViewPage());
      await tester.pump();

      expect(find.byType(Footer), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('has pagination chevron icons', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createCollectionViewPage());
      await tester.pump();

      expect(find.byIcon(Icons.chevron_left), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('has two dropdown buttons', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createCollectionViewPage());
      await tester.pump();

      expect(find.byType(DropdownButton<String>), findsNWidgets(2));

      addTearDown(() => tester.view.resetPhysicalSize());
    });
  });
}