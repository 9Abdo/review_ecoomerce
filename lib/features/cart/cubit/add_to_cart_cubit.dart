import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_ecommerce/features/cart/cubit/add_to_cart_state.dart';
import 'package:review_ecommerce/features/services/add_to_cart_services.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this.addToCartServices)
      : super(AddToCartInitialState());

  final AddToCartServices addToCartServices;

  Future<void> addToCart({
    required int productId,
    required int quantity,
  }) async {
    emit(AddToCartLoadingState());

    try {
      final cart = await addToCartServices.postToCart(
        productId: productId,
        quantity: quantity,
      );

      emit(AddToCartSuccessState(cart));
    } on DioException catch (e) {
      emit(
        AddToCartFailureState(
          e.message ?? "Something went wrong",
        ),
      );
    } catch (e) {
      emit(
        AddToCartFailureState(
          e.toString(),
        ),
      );
    }
  }
}