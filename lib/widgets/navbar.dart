import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
        children: [
          // Top banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF4d2963),
            child: const Text(
              'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          // Main header
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => navigateToHome(context),
                    child: Image.network(
                      'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                      height: 18,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          width: 18,
                          height: 18,
                          child: const Center(
                            child: Icon(Icons.image_not_supported, color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  _navButton(context, 'Home', () => navigateToHome(context)),
                  const SizedBox(width: 8),
                  _navButton(context, 'Shops', placeholderCallbackForButtons),
                  const SizedBox(width: 8),
                  _navButton(context, 'The Print Shack', placeholderCallbackForButtons),
                  const SizedBox(width: 8),
                  _navButton(context, 'SALE!', placeholderCallbackForButtons),
                  const SizedBox(width: 8),
                  _navButton(context, 'About us', () => Navigator.pushNamed(context, '/about')),
                  const Spacer(),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _iconButton(Icons.search, placeholderCallbackForButtons),
                        _iconButton(Icons.person_outline, placeholderCallbackForButtons),
                        _iconButton(Icons.shopping_bag_outlined, placeholderCallbackForButtons),
                        _iconButton(Icons.menu, placeholderCallbackForButtons),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navButton(BuildContext context, String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF4d2963),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        visualDensity: VisualDensity.compact,
      ),
      child: Text(text),
    );
  }

  Widget _iconButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon, size: 18, color: Colors.grey),
      padding: const EdgeInsets.all(8),
      constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
      onPressed: onPressed,
    );
  }
}
