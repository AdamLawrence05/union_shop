import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/collection_card.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

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
              child: Column(
                children: [
                  const Text(
                    'Collections',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 48),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 600 ? 4 : 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    children: const [
                      CollectionCard(
                        title: 'Clothing',
                        imageUrl: 'assets/images/EssentialShirt.png',
                      ),
                      CollectionCard(
                        title: 'Merchandise',
                        imageUrl: 'assets/images/SignatureWB.png',
                      ),
                      CollectionCard(
                        title: 'Graduation',
                        imageUrl: 'assets/images/EssentialHoodie.png',
                      ),
                      CollectionCard(
                        title: 'SALE!',
                        imageUrl: 'assets/images/CDs.png',
                      ),
                    ],
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
