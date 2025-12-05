class Product {
  final String id;
  final String title;
  final String price;
  final double priceValue;
  final String imageUrl;
  final String description;
  final String category;
  final bool onSale;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.priceValue,
    required this.imageUrl,
    required this.description,
    required this.category,
    this.onSale = false,
  });
}

const List<Product> allProducts = [
  Product(
    id: '1',
    title: 'Essential T-Shirt',
    price: 'Was £10.00, Now £8.00',
    priceValue: 8.00,
    imageUrl: 'assets/images/EssentialShirt.png',
    description: 'A comfortable essential t-shirt perfect for everyday wear. Made from 100% cotton.',
    category: 'clothing',
    onSale: true,
  ),
  Product(
    id: '2',
    title: 'Essential Hoodie',
    price: 'Was £20.00, Now £15.99',
    priceValue: 15.99,
    imageUrl: 'assets/images/EssentialHoodie.png',
    description: 'Stay warm with our essential hoodie. Features a front pocket and adjustable drawstring hood.',
    category: 'clothing',
    onSale: true,
  ),
  Product(
    id: '3',
    title: 'Signature CDs',
    price: 'Was £2.00, Now £1.50',
    priceValue: 1.50,
    imageUrl: 'assets/images/CDs.png',
    description: 'Collectible signature CDs featuring exclusive content.',
    category: 'merchandise',
    onSale: true,
  ),
  Product(
    id: '4',
    title: 'Signature Water Bottle',
    price: '£5.00',
    priceValue: 5.00,
    imageUrl: 'assets/images/SignatureWB.png',
    description: 'Stay hydrated with our signature water bottle. BPA-free and holds 500ml.',
    category: 'merchandise',
    onSale: false,
  ),
];
