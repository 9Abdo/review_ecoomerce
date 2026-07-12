import 'package:review_ecommerce/features/models/add_to_cart_model.dart';

abstract class AddToCartState {}

class AddToCartInitialState extends AddToCartState {}

class AddToCartLoadingState extends AddToCartState {}

class AddToCartSuccessState extends AddToCartState {
  final AddToCartModel cart;

  AddToCartSuccessState(this.cart);
}

class AddToCartFailureState extends AddToCartState {
  final String error;

  AddToCartFailureState(this.error);
}