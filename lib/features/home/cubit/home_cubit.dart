import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:review_ecommerce/features/Auth/services/home_services.dart';
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
      print("Type: ${e.type}");
  print("Message: ${e.message}");
  print("Error: ${e.error}");

      emit(
        FailureState(
          e.message ?? "Opps try agian",
        ),
      );
    } catch (e) {
      emit(FailureState(e.toString()));
    }
  }
}