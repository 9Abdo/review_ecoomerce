import 'package:review_ecommerce/features/models/home_modal.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class LoadingState extends HomeState {}

class SuccessfulState extends HomeState {
  final List<Homemodel> products;

  SuccessfulState(this.products);
}

class FailureState extends HomeState {
  final String error;

  FailureState(this.error);
}