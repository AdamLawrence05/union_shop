import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {}

  void _openMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _mobileNavItem(context, 'Home', () {
              Navigator.pop(context);
              navigateToHome(context);
            }),
            _mobileExpandableItem(
              context,
              'Shops',
              [
                {'label': 'Clothing', 'route': '/'},
                {'label': 'Merchandise', 'route': '/'},
                {'label': 'Signature & Essential', 'route': '/'},
              ],
            ),
            _mobileExpandableItem(
              context,
              'The Print Shack',
              [
                {'label': 'About', 'route': '/print-shack-about'},
                {'label': 'Personalisation', 'route': '/print-shack'},
              ],
            ),
            _mobileNavItem(context, 'SALE!', () => Navigator.pop(context)),
            _mobileNavItem(context, 'About us', () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/about');
            }),
          ],
        ),
      ),
    );
  }

  Widget _mobileNavItem(BuildContext context, String text, VoidCallback onTap) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(color: Color(0xFF4d2963)),
      ),
      onTap: onTap,
    );
  }

  Widget _mobileExpandableItem(BuildContext context, String title, List<Map<String, String>> items) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(color: Color(0xFF4d2963)),
      ),
      iconColor: const Color(0xFF4d2963),
      collapsedIconColor: const Color(0xFF4d2963),
      children: items.map((item) {
        return ListTile(
          contentPadding: const EdgeInsets.only(left: 32),
          title: Text(
            item['label']!,
            style: const TextStyle(color: Color(0xFF4d2963), fontSize: 14),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, item['route']!);
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final navbarHeight = isMobile ? 130.0 : 100.0;

        return Container(
          height: navbarHeight,
          color: Colors.white,
          child: Column(
            children: [
              // Top banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8),
                color: const Color(0xFF4d2963),
                child: Text(
                  'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: isMobile ? 12 : 16),
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
                          height: isMobile ? 32 : 18,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              width: isMobile ? 32 : 18,
                              height: isMobile ? 32 : 18,
                              child: const Center(
                                child: Icon(Icons.image_not_supported, color: Colors.grey),
                              ),
                            );
                          },
                        ),
                      ),
                      if (!isMobile) ...[
                        const SizedBox(width: 8),
                        _navButton(context, 'Home', () => navigateToHome(context)),
                        const SizedBox(width: 8),
                        _dropdownButton(context, 'Shops', ['Clothing', 'Merchandise', 'Signature & Essential']),
                        const SizedBox(width: 8),
                        _dropdownButton(context, 'The Print Shack', ['About', 'Personalisation']),
                        const SizedBox(width: 8),
                        _navButton(context, 'SALE!', placeholderCallbackForButtons),
                        const SizedBox(width: 8),
                        _navButton(context, 'About us', () => Navigator.pushNamed(context, '/about')),
                      ],
                      const Spacer(),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _iconButton(Icons.search, placeholderCallbackForButtons, isMobile),
                            _iconButton(Icons.person_outline, placeholderCallbackForButtons, isMobile),
                            _iconButton(Icons.shopping_bag_outlined, placeholderCallbackForButtons, isMobile),
                            if (isMobile)
                              IconButton(
                                icon: const Icon(Icons.menu, size: 28, color: Colors.grey),
                                padding: const EdgeInsets.all(8),
                                constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
                                onPressed: () => _openMobileMenu(context),
                              ),
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
      },
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

  Widget _iconButton(IconData icon, VoidCallback onPressed, [bool isMobile = false]) {
    return IconButton(
      icon: Icon(icon, size: isMobile ? 24 : 18, color: Colors.grey),
      padding: const EdgeInsets.all(8),
      constraints: BoxConstraints(minWidth: isMobile ? 40 : 32, minHeight: isMobile ? 40 : 32),
      onPressed: onPressed,
    );
  }

  Widget _dropdownButton(BuildContext context, String label, List<String> items) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        switch (value) {
          case 'about':
            Navigator.pushNamed(context, '/print-shack-about');
            break;
          case 'personalisation':
            Navigator.pushNamed(context, '/print-shack');
            break;
          case 'clothing':
            navigateToHome(context);
            break;
          case 'merchandise':
            navigateToHome(context);
            break;
          case 'signature & essential':
            navigateToHome(context);
            break;
        }
      },
      offset: const Offset(0, 40),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF4d2963))),
          const Icon(Icons.arrow_drop_down, color: Color(0xFF4d2963), size: 20),
        ],
      ),
      itemBuilder: (context) => items
          .map((item) => PopupMenuItem(value: item.toLowerCase(), child: Text(item)))
          .toList(),
    );
  }
}
