import 'package:dio/dio.dart';
import 'package:review_ecommerce/features/models/home_modal.dart';

class HomeServices {
  final Dio dio;
  HomeServices({required this.dio});
  Future<List<Homemodel>> getHomeService() async {
    Response response = await dio.get(
      "https://api.escuelajs.co/api/v1/products",
    );
    List homeDate = response.data;
    List<Homemodel> dateHome = homeDate
        .map((e) => Homemodel.fromjson(e))
        .toList();
    return dateHome;
  }
}
