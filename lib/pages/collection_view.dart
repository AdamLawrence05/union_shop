import 'package:flutter/material.dart';
import 'package:union_shop/widgets/navbar.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/data/products.dart';

class CollectionViewPage extends StatefulWidget {
  const CollectionViewPage({super.key});

  @override
  State<CollectionViewPage> createState() => _CollectionViewPageState();
}

class _CollectionViewPageState extends State<CollectionViewPage> {
  String _sortBy = 'Name (A-Z)';
  String _categoryFilter = 'All';
  int _currentPage = 0;
  final int _itemsPerPage = 4;

  List<Product> _getFilteredProducts(String collectionName) {
    List<Product> results = List.from(allProducts);

    // Filter by collection/category
    if (collectionName.toLowerCase() == 'sale!') {
      results = results.where((p) => p.onSale).toList();
    } else if (collectionName.toLowerCase() != 'all') {
      results = results.where((p) => p.category.toLowerCase() == collectionName.toLowerCase()).toList();
    }

    // Filter by category dropdown
    if (_categoryFilter != 'All') {
      results = results.where((p) => p.category.toLowerCase() == _categoryFilter.toLowerCase()).toList();
    }

    // Sort
    switch (_sortBy) {
      case 'Name (A-Z)':
        results.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Name (Z-A)':
        results.sort((a, b) => b.title.compareTo(a.title));
        break;
      case 'Price (Low-High)':
        results.sort((a, b) => a.priceValue.compareTo(b.priceValue));
        break;
      case 'Price (High-Low)':
        results.sort((a, b) => b.priceValue.compareTo(a.priceValue));
        break;
    }

    return results;
  }

  List<Product> _getPaginatedProducts(List<Product> products) {
    final startIndex = _currentPage * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;
    if (startIndex >= products.length) return [];
    return products.sublist(
      startIndex,
      endIndex > products.length ? products.length : endIndex,
    );
  }

  int _getTotalPages(List<Product> products) {
    return (products.length / _itemsPerPage).ceil();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String collectionName = args?['collection'] ?? 'All';

    final filteredProducts = _getFilteredProducts(collectionName);
    final paginatedProducts = _getPaginatedProducts(filteredProducts);
    final totalPages = _getTotalPages(filteredProducts);

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
                  const SizedBox(height: 24),

                  // Sorting and Filtering Row
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      // Sort Dropdown
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Sort by: '),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: DropdownButton<String>(
                              value: _sortBy,
                              underline: const SizedBox(),
                              items: [
                                'Name (A-Z)',
                                'Name (Z-A)',
                                'Price (Low-High)',
                                'Price (High-Low)',
                              ].map((option) {
                                return DropdownMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    _sortBy = value;
                                    _currentPage = 0;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),

                      // Category Filter Dropdown
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Category: '),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: DropdownButton<String>(
                              value: _categoryFilter,
                              underline: const SizedBox(),
                              items: ['All', 'Clothing', 'Merchandise'].map((option) {
                                return DropdownMenuItem(
                                  value: option,
                                  child: Text(option),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    _categoryFilter = value;
                                    _currentPage = 0;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Products Grid
                  if (paginatedProducts.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(48),
                      child: Text('No products found.'),
                    )
                  else
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: paginatedProducts.map((product) {
                        return ProductCard(
                          title: product.title,
                          price: product.price,
                          imageUrl: product.imageUrl,
                          description: product.description,
                          category: product.category,
                        );
                      }).toList(),
                    ),

                  const SizedBox(height: 32),

                  // Pagination
                  if (totalPages > 1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: _currentPage > 0
                              ? () => setState(() => _currentPage--)
                              : null,
                          icon: const Icon(Icons.chevron_left),
                          color: const Color(0xFF4d2963),
                        ),
                        ...List.generate(totalPages, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: ElevatedButton(
                              onPressed: () => setState(() => _currentPage = index),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _currentPage == index
                                    ? const Color(0xFF4d2963)
                                    : Colors.grey[300],
                                foregroundColor: _currentPage == index
                                    ? Colors.white
                                    : Colors.black,
                                minimumSize: const Size(40, 40),
                                padding: EdgeInsets.zero,
                              ),
                              child: Text('${index + 1}'),
                            ),
                          );
                        }),
                        IconButton(
                          onPressed: _currentPage < totalPages - 1
                              ? () => setState(() => _currentPage++)
                              : null,
                          icon: const Icon(Icons.chevron_right),
                          color: const Color(0xFF4d2963),
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