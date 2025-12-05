import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/product_card.dart';

class CollectionViewPage extends StatelessWidget {
  const CollectionViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String collectionName = args?['collection'] ?? 'Collection';

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Navbar(),

            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    collectionName.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 48),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount:
                        MediaQuery.of(context).size.width > 600 ? 3 : 1,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 48,
                    children: _getProductsForCollection(collectionName),
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

  List<Widget> _getProductsForCollection(String collection) {
    switch (collection.toLowerCase()) {
      case 'clothing':
        return const [
          ProductCard(
            title: 'Essential T-Shirt',
            price: 'Was £10.00, Now £8.00',
            imageUrl: 'assets/images/EssentialShirt.png',
            description: 'A comfortable essential t-shirt perfect for everyday wear. Made from 100% cotton.',
            category: 'clothing',
          ),
          ProductCard(
            title: 'Essential Hoodie',
            price: 'Was £20.00, Now £15.99',
            imageUrl: 'assets/images/EssentialHoodie.png',
            description: 'Stay warm with our essential hoodie. Features a front pocket and adjustable drawstring hood.',
            category: 'clothing',
          ),
        ];
      case 'merchandise':
        return const [
          ProductCard(
            title: 'Signature CDs',
            price: '£2.00',
            imageUrl: 'assets/images/CDs.png',
            description: 'Collectible signature CDs featuring exclusive content.',
            category: 'merchandise',
          ),
          ProductCard(
            title: 'Signature Water Bottle',
            price: '£5.00',
            imageUrl: 'assets/images/SignatureWB.png',
            description: 'Stay hydrated with our signature water bottle. BPA-free and holds 500ml.',
            category: 'merchandise',
          ),
        ];
      case 'sale!':
        return const [
          ProductCard(
            title: 'Essential T-Shirt',
            price: 'Was £10.00, Now £8.00',
            imageUrl: 'assets/images/EssentialShirt.png',
            description: 'A comfortable essential t-shirt perfect for everyday wear. Made from 100% cotton.',
            category: 'clothing',
          ),
          ProductCard(
            title: 'Essential Hoodie',
            price: 'Was £20.00, Now £15.99',
            imageUrl: 'assets/images/EssentialHoodie.png',
            description: 'Stay warm with our essential hoodie. Features a front pocket and adjustable drawstring hood.',
            category: 'clothing',
          ),
          ProductCard(
            title: 'Signature CDs',
            price: 'Was £2.00, Now £1.50',
            imageUrl: 'assets/images/CDs.png',
            description: 'Collectible signature CDs featuring exclusive content.',
            category: 'merchandise',
          ),
        ];
      default:
        return const [];
    }
  }
}
