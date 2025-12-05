import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/data/products.dart';

void main() {
  group('Product Data Tests', () {
    test('Product class has required fields', () {
      const product = Product(
        id: 'test-1',
        title: 'Test Product',
        price: '£10.00',
        priceValue: 10.00,
        imageUrl: 'assets/images/test.png',
        description: 'Test description',
        category: 'test',
        type: 'clothing',
      );

      expect(product.id, 'test-1');
      expect(product.title, 'Test Product');
      expect(product.price, '£10.00');
      expect(product.priceValue, 10.00);
      expect(product.onSale, false);
    });

    test('Product onSale defaults to false', () {
      const product = Product(
        id: '1',
        title: 'Test',
        price: '£5.00',
        priceValue: 5.00,
        imageUrl: '',
        description: '',
        category: 'test',
        type: 'merchandise',
      );

      expect(product.onSale, false);
    });

    test('Product onSale can be set to true', () {
      const product = Product(
        id: '1',
        title: 'Sale Item',
        price: '£5.00',
        priceValue: 5.00,
        imageUrl: '',
        description: '',
        category: 'test',
        type: 'merchandise',
        onSale: true,
      );

      expect(product.onSale, true);
    });

    test('allProducts list is not empty', () {
      expect(allProducts.isNotEmpty, true);
    });

    test('allProducts contains sale items', () {
      final saleItems = allProducts.where((p) => p.onSale).toList();
      expect(saleItems.isNotEmpty, true);
    });

    test('allProducts contains clothing items', () {
      final clothingItems = allProducts.where((p) => p.type == 'clothing').toList();
      expect(clothingItems.isNotEmpty, true);
    });

    test('allProducts contains merchandise items', () {
      final merchandiseItems = allProducts.where((p) => p.type == 'merchandise').toList();
      expect(merchandiseItems.isNotEmpty, true);
    });

    test('all products have valid priceValue', () {
      for (final product in allProducts) {
        expect(product.priceValue, greaterThan(0));
      }
    });
  });
}
