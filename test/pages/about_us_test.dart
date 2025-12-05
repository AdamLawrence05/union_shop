import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/about_us.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';

void main() {
  group('About Us Page Tests', () {
    Widget createAboutUsPage() {
      return MaterialApp(
        home: const AboutUsPage(),
        routes: {
          '/collection': (context) => const Scaffold(body: Text('Collection')),
          '/login': (context) => const Scaffold(body: Text('Login')),
          '/collections': (context) => const Scaffold(body: Text('Collections')),
        },
      );
    }

    testWidgets('displays About Us title', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createAboutUsPage());
      await tester.pump();

      expect(find.text('About Us'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays welcome message', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createAboutUsPage());
      await tester.pump();

      expect(find.textContaining('Welcome to the Union Shop!'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays contact email', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createAboutUsPage());
      await tester.pump();

      expect(find.textContaining('hello@upsu.net'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('displays team signature', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createAboutUsPage());
      await tester.pump();

      expect(find.textContaining('The Union Shop & Reception Team'), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('has navbar', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createAboutUsPage());
      await tester.pump();

      expect(find.byType(Navbar), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });

    testWidgets('has footer', (tester) async {
      tester.view.physicalSize = const Size(1200, 1600);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(createAboutUsPage());
      await tester.pump();

      expect(find.byType(Footer), findsOneWidget);

      addTearDown(() => tester.view.resetPhysicalSize());
    });
  });
}