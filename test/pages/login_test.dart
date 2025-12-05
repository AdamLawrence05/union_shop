import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/login.dart';

void main() {
  group('Login Page Tests', () {
    Widget createLoginPage() {
      return const MaterialApp(
        home: LoginPage(),
      );
    }

    testWidgets('displays Sign in with Shop button', (tester) async {
      await tester.pumpWidget(createLoginPage());
      await tester.pump();

      expect(find.text('Sign in with Shop'), findsOneWidget);
    });

    testWidgets('displays Email text field', (tester) async {
      await tester.pumpWidget(createLoginPage());
      await tester.pump();

      expect(find.text('Email'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('displays Continue button', (tester) async {
      await tester.pumpWidget(createLoginPage());
      await tester.pump();

      expect(find.text('Continue'), findsOneWidget);
    });

    testWidgets('displays or divider', (tester) async {
      await tester.pumpWidget(createLoginPage());
      await tester.pump();

      expect(find.text('or'), findsOneWidget);
    });

    testWidgets('email field accepts input', (tester) async {
      await tester.pumpWidget(createLoginPage());
      await tester.pump();

      final emailField = find.byType(TextField);
      await tester.enterText(emailField, 'test@example.com');
      await tester.pump();

      expect(find.text('test@example.com'), findsOneWidget);
    });

    testWidgets('has two ElevatedButtons', (tester) async {
      await tester.pumpWidget(createLoginPage());
      await tester.pump();

      expect(find.byType(ElevatedButton), findsNWidgets(2));
    });
  });
}