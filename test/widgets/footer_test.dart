import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/footer.dart';

void main() {
  group('Footer Widget Tests', () {
    Widget createFooter() {
      return const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Footer(),
          ),
        ),
      );
    }

    testWidgets('displays term time heading', (tester) async {
      await tester.pumpWidget(createFooter());
      await tester.pump();

      expect(find.text('(Term Time)'), findsOneWidget);
    });

    testWidgets('displays term time hours', (tester) async {
      await tester.pumpWidget(createFooter());
      await tester.pump();

      expect(find.text('Monday - Friday 10am - 4pm'), findsOneWidget);
    });

    testWidgets('displays outside term time heading', (tester) async {
      await tester.pumpWidget(createFooter());
      await tester.pump();

      expect(find.text('(Outside of Term Time / Consolidation Weeks)'), findsOneWidget);
    });

    testWidgets('displays outside term time hours', (tester) async {
      await tester.pumpWidget(createFooter());
      await tester.pump();

      expect(find.text('Monday - Friday 10am - 3pm'), findsOneWidget);
    });

    testWidgets('displays online purchase text', (tester) async {
      await tester.pumpWidget(createFooter());
      await tester.pump();

      expect(find.text('Purchase online 24/7'), findsOneWidget);
    });

    testWidgets('displays upsu-store link', (tester) async {
      await tester.pumpWidget(createFooter());
      await tester.pump();

      expect(find.text('upsu-store'), findsOneWidget);
    });

    testWidgets('upsu-store link is tappable', (tester) async {
      await tester.pumpWidget(createFooter());
      await tester.pump();

      final storeLink = find.text('upsu-store');
      expect(storeLink, findsOneWidget);

      // Verify it's wrapped in a GestureDetector
      expect(
        find.ancestor(of: storeLink, matching: find.byType(GestureDetector)),
        findsOneWidget,
      );
    });
  });
}