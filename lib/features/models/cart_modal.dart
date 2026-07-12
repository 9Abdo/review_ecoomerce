class CartModal {
  final String title;
  final double price;
  final int quantity;
  final double discountPercentage;
  final String thumbnail;

  // بيانات الكارت
  final double? total;
  final double? discountedTotal;
  final int? totalProducts;
  final int? totalQuantity;

  CartModal({
    required this.title,
    required this.price,
    required this.quantity,
    required this.discountPercentage,
    required this.thumbnail,
    this.total,
    this.discountedTotal,
    this.totalProducts,
    this.totalQuantity,
  });

  factory CartModal.fromJson(
    Map<String, dynamic> json, {
    double? total,
    double? discountedTotal,
    int? totalProducts,
    int? totalQuantity,
  }) {
    return CartModal(
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      discountPercentage:
          (json['discountPercentage'] as num).toDouble(),
      thumbnail: json['thumbnail'],
      total: total,
      discountedTotal: discountedTotal,
      totalProducts: totalProducts,
      totalQuantity: totalQuantity,
    );
  }
}