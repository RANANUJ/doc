// lib/models/product_model.dart
class Product {
  final String name;
  final String brand;
  final String price;
  final String image;
  final String howToUse;
  final String benefits;
  final String buyLink;
  bool isFavorite;

  Product({
    required this.name,
    required this.brand,
    required this.price,
    required this.image,
    required this.howToUse,
    required this.benefits,
    required this.buyLink,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'brand': brand,
      'price': price,
      'image': image,
      'howToUse': howToUse,
      'benefits': benefits,
      'buyLink': buyLink,
      'isFavorite': isFavorite,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      brand: map['brand'],
      price: map['price'],
      image: map['image'],
      howToUse: map['howToUse'],
      benefits: map['benefits'],
      buyLink: map['buyLink'],
      isFavorite: map['isFavorite'] ?? false,
    );
  }

  Product copyWith({bool? isFavorite}) {
    return Product(
      name: name,
      brand: brand,
      price: price,
      image: image,
      howToUse: howToUse,
      benefits: benefits,
      buyLink: buyLink,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
