import 'package:review_ecommerce/features/models/cart_modal.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessfulState extends CartState {
  final List<CartModal> products;

  CartSuccessfulState(this.products);
}

class CartFailureState extends CartState {
  final String error;

  CartFailureState(this.error);
}