import 'package:cloud_firestore/cloud_firestore.dart';

class Purchase {
  final String id;
  final String productName;
  final int quantity;
  final double price;
  final DateTime purchaseDate;
  final String status;
  final String? imageUrl;

  Purchase({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.purchaseDate,
    required this.status,
    this.imageUrl,
  });

  factory Purchase.fromFirestore(Map<String, dynamic> data, String id) {
    return Purchase(
      id: id,
      productName: data['productName'] ?? '',
      quantity: data['quantity'] ?? 0,
      price: (data['price'] ?? 0).toDouble(),
      purchaseDate: (data['purchaseDate'] as Timestamp).toDate(),
      status: data['status'] ?? 'unknown',
      imageUrl: data['imageUrl'],
    );
  }
}
