import 'package:dio/dio.dart';
import 'package:review_ecommerce/features/models/add_to_cart_model.dart';

class AddToCartServices {
  final Dio dio;

  AddToCartServices({required this.dio});

  Future<AddToCartModel> postToCart({
    required int productId,
    required int quantity,
  }) async {
    Response response = await dio.post(
      "https://dummyjson.com/carts/add",
      data: {
        "userId": 1,
        "products": [
          {
            "id": productId,
            "quantity": quantity,
          }
        ],
      },
    );

    return AddToCartModel.fromJson(response.data);
  }
}