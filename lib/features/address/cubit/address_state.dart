import 'package:review_ecommerce/features/models/address_modal.dart';


abstract class AddressState {}

class AddressInitialState extends AddressState {}

class AddressLoadingState extends AddressState {}

class AddressSuccessfulState extends AddressState {
  final List<AddressModal> addresses;

  AddressSuccessfulState(this.addresses);
}

class AddressFailureState extends AddressState {
  final String error;

  AddressFailureState(this.error);
}