import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_ecommerce/features/services/home_services.dart';
import 'package:review_ecommerce/features/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeServices) : super(HomeInitialState());

  final HomeServices homeServices;


  Future<void> getProducts() async {
    emit(LoadingState());

    try {
      final products = await homeServices.getHomeService();
      emit(SuccessfulState(products));
    } on DioException catch (e) {
      emit(FailureState(e.message ?? "Oops try again"));
    } catch (e) {
      emit(FailureState(e.toString()));
    }
  }
// get product by category
  Future<void> getProductsByCategory(int categoryId) async {
    emit(LoadingState());

    try {
      final products =
          await homeServices.getProductsByCategory(categoryId);

      emit(SuccessfulState(products));
    } on DioException catch (e) {
      emit(FailureState(e.message ?? "Oops try again"));
    } catch (e) {
      emit(FailureState(e.toString()));
    }
  }
}