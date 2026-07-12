import 'package:review_ecommerce/features/models/categorymodal.dart';

abstract class CategoryState {}

class CategoryInitialState extends CategoryState{}

class GayegoryLoadingState extends CategoryState {}

class GayegorySuccessfulState extends CategoryState {
  final List<Categorymodal> category;

  GayegorySuccessfulState(this.category);
}

class GayegoryFailureState extends CategoryState {
  final String error;

  GayegoryFailureState(this.error);
}