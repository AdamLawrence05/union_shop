class Product {
  final String title;
  final String price;
  final String imageUrl;
  final String description;
  final String category;

  const Product({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.category,
  });
}

const List<Product> essentialProducts = [
  Product(
    title: 'Essential T-Shirt',
    price: 'Was £10.00, Now £8.00',
    imageUrl: 'assets/images/EssentialShirt.png',
    description: 'A comfortable essential t-shirt perfect for everyday wear. Made from 100% cotton.',
    category: 'clothing',
  ),
  Product(
    title: 'Essential Hoodie',
    price: 'Was £20.00, Now £15.99',
    imageUrl: 'assets/images/EssentialHoodie.png',
    description: 'Stay warm with our essential hoodie. Features a front pocket and adjustable drawstring hood.',
    category: 'clothing',
  ),
];

const List<Product> signatureProducts = [
  Product(
    title: 'Signature CDs',
    price: '£2.00',
    imageUrl: 'assets/images/CDs.png',
    description: 'Collectible signature CDs featuring exclusive content.',
    category: 'merchandise',
  ),
  Product(
    title: 'Signature Water Bottle',
    price: '£5.00',
    imageUrl: 'assets/images/SignatureWB.png',
    description: 'Stay hydrated with our signature water bottle. BPA-free and holds 500ml.',
    category: 'merchandise',
  ),
];
