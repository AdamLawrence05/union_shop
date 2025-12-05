import 'package:flutter/material.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/pages/about_us.dart';
import 'package:union_shop/pages/collection_view.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/collection_card.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/pages/print_shack.dart';
import 'package:union_shop/pages/print_shack_about.dart';
import 'package:union_shop/pages/login.dart';
import 'package:union_shop/pages/collections.dart';


void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // When navigating to '/product', build and return the ProductPage
      // In your browser, try this link: http://localhost:49856/#/product
      routes: {
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutUsPage(),
        '/collection': (context) => const CollectionViewPage(),
        '/collections': (context) => const CollectionsPage(),
        '/print-shack': (context) => const PrintShackPage(),
        '/print-shack-about': (context) => const PrintShackAboutPage(),
        '/login': (context) => const LoginPage(),
        
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Auto-cycle every 5 seconds
    Future.delayed(const Duration(seconds: 5), _autoScroll);
  }

  void _autoScroll() {
    if (!mounted) return;
    final nextPage = (_currentPage + 1) % 2;
    _pageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    Future.delayed(const Duration(seconds: 5), _autoScroll);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
  }

  void placeholderCallbackForButtons() {}

  Widget _buildHeroSlide({
    required String image,
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
        ),
        Positioned(
          left: 24,
          right: 24,
          top: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4d2963),
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(fontSize: 14, letterSpacing: 1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const Navbar(),

            // Hero Carousel Section
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: [
                      // Slide 1
                      _buildHeroSlide(
                        image: 'assets/images/EssentialHoodie.png',
                        title: 'Essential Range - Over 20% OFF!',
                        subtitle: 'Over 20% off our essential range. Come and grab yours while stock lasts!',
                        buttonText: 'BROWSE PRODUCTS',
                        onPressed: placeholderCallbackForButtons,
                      ),
                      // Slide 2
                      _buildHeroSlide(
                        image: 'assets/images/PersonalisedShirt.png',
                        title: 'The Print Shack',
                        subtitle: 'Personalise your clothing with custom prints and embroidery!',
                        buttonText: 'LEARN MORE',
                        onPressed: () => Navigator.pushNamed(context, '/print-shack-about'),
                      ),
                    ],
                  ),
                  // Page indicators
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(2, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? Colors.white
                                : Colors.white.withOpacity(0.5),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'ESSSENTIAL RANGE - OVER 20% OFF!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: const [
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
                      ],
                    ),
                    const SizedBox(height: 48),
                    const Text(
                      'SIGNATURE COLLECTION',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: const [
                        ProductCard(
                          title: 'Signature CDs',
                          price: 'Was £2.00, now £1.50',
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
                      ],
                    ),
                    const SizedBox(height: 48),
                    const Text(
                      'OUR RANGE',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
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
                          title: 'SALE!',
                          imageUrl: 'assets/images/CDs.png',
                        ),
                        CollectionCard(
                          title: 'Essentials',
                          imageUrl: 'assets/images/UniversityMug.png',
                        ), 
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}

