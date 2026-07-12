import 'package:dio/dio.dart';
import 'package:review_ecommerce/features/models/address_modal.dart';


class AddressServices {
  final Dio dio;

  AddressServices({required this.dio});

  Future<List<AddressModal>> getAddresses() async {
    Response response = await dio.get(
      "https://api.escuelajs.co/api/v1/locations",
    );

    List data = response.data;

    List<AddressModal> addresses = data
        .map((e) => AddressModal.fromJson(e))
        .toList();

    return addresses;
  }
}