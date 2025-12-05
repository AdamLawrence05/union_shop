import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/widgets/collection_card.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('displays Essential Range section title', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(const UnionShopApp());
      });
      await tester.pump();

      expect(find.text('ESSSENTIAL RANGE - OVER 20% OFF!'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Signature Collection section title', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(const UnionShopApp());
      });
      await tester.pump();

      expect(find.text('SIGNATURE COLLECTION'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Our Range section title', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(const UnionShopApp());
      });
      await tester.pump();

      expect(find.text('OUR RANGE'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays product cards', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(const UnionShopApp());
      });
      await tester.pump();

      expect(find.byType(ProductCard), findsAtLeast(1));

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays collection cards', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(const UnionShopApp());
      });
      await tester.pump();

      expect(find.byType(CollectionCard), findsAtLeast(1));

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Essential T-Shirt product', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(const UnionShopApp());
      });
      await tester.pump();

      expect(find.text('Essential T-Shirt'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays Essential Hoodie product', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(const UnionShopApp());
      });
      await tester.pump();

      expect(find.text('Essential Hoodie'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays navbar', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(const UnionShopApp());
      });
      await tester.pump();

      expect(find.byType(Navbar), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays footer', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(const UnionShopApp());
      });
      await tester.pump();

      expect(find.byType(Footer), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays hero carousel', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(const UnionShopApp());
      });
      await tester.pump();

      expect(find.byType(PageView), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays BROWSE PRODUCTS button', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.runAsync(() async {
        await tester.pumpWidget(const UnionShopApp());
      });
      await tester.pump();

      expect(find.text('BROWSE PRODUCTS'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });
  });
}
