import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';

class PrintShackAboutPage extends StatelessWidget {
  const PrintShackAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Text(
                    'About The Print Shack',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/PrintShackLogo.png',
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 24),
                      Image.asset(
                        'assets/images/PersonalisedShirt.png',
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  const Text(
                    'PERSONALISATION',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Make it yours! The Print Shack offers a range of personalisation services to help you stand out. From custom prints to embroidery, we can help bring your ideas to life.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                                    const SizedBox(height: 48),
                  const Text(
                    'Pricing',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Customising wont break your bank - at just £3 for a line or text or a small print and £5 for a large print or embroidery, you can add a personal touch to your items without worrying about the costs.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const Footer(),
          ],
        ),
      ),
    );
  }
}
