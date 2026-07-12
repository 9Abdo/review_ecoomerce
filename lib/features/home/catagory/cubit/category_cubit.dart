import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_ecommerce/features/services/category_services.dart';
import 'package:review_ecommerce/features/home/catagory/cubit/category_state.dart';



class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryServices)
      : super(CategoryInitialState());

  final GategoryServices categoryServices;

  Future<void> getCategories() async {
    emit(GayegoryLoadingState());

    try {
      final categories = await categoryServices.getGategory();

      emit(GayegorySuccessfulState(categories));
    } on DioException catch (e) {
      emit(
        GayegoryFailureState(
          e.message ?? "Oops, try again",
        ),
      );
    } catch (e) {
      emit(GayegoryFailureState(e.toString()));
    }
  }
}