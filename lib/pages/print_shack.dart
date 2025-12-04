import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';

class PrintShackPage extends StatelessWidget {
  const PrintShackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),

            // Page content goes here
            Container(
              padding: const EdgeInsets.all(24),
              child: const Center(
                child: Text(
                  'Print Shack',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const Footer(),
          ],
        ),
      ),
    );
  }
}
