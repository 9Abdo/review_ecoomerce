import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_ecommerce/features/services/address_services.dart';
import 'package:review_ecommerce/features/address/cubit/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit(this.addressServices)
      : super(AddressInitialState());

  final AddressServices addressServices;

  Future<void> getAddresses() async {
    emit(AddressLoadingState());

    try {
      final addresses = await addressServices.getAddresses();

      emit(AddressSuccessfulState(addresses));
    } on DioException catch (e) {
      emit(
        AddressFailureState(
          e.message ?? "Something went wrong",
        ),
      );
    } catch (e) {
      emit(
        AddressFailureState(e.toString()),
      );
    }
  }
}