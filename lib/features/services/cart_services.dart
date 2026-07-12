import 'package:dio/dio.dart';
import 'package:review_ecommerce/features/models/cart_modal.dart';

class CartServices {
  final Dio dio;

  CartServices({required this.dio});

  Future<List<CartModal>> getCart() async {
    Response response = await dio.get(
      "https://dummyjson.com/carts/1",
    );

    final data = response.data;
    List products = data['products'];

    List<CartModal> datecart = products
        .map(
          (e) => CartModal.fromJson(
            e,
            total: (data['total'] as num).toDouble(),
            discountedTotal: (data['discountedTotal'] as num).toDouble(),
            totalProducts: data['totalProducts'],
            totalQuantity: data['totalQuantity'],
          ),
        )
        .toList();

    return datecart;
  }
}