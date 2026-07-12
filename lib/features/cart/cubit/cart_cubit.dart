import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_ecommerce/features/services/cart_services.dart';
import 'package:review_ecommerce/features/cart/cubit/cart_state.dart';


class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartServices) : super(CartInitialState());

  final CartServices cartServices;

  Future<void> getCart() async {
    emit(CartLoadingState());

    try {
      final products = await cartServices.getCart();

      emit(CartSuccessfulState(products));
    } on DioException catch (e) {
      emit(
        CartFailureState(
          e.message ?? "Oops, try again",
        ),
      );
    } catch (e) {
      emit(
        CartFailureState(e.toString()),
      );
    }
  }
}