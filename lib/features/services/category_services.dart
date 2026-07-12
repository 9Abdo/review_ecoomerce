import 'package:dio/dio.dart';
import 'package:review_ecommerce/features/models/categorymodal.dart';

class GategoryServices {
  final Dio dio;
  GategoryServices({required this.dio});
  Future<List<Categorymodal>> getGategory() async {
    Response response = await dio.get(
      "https://api.escuelajs.co/api/v1/categories",
    );
    List gategorydate = response.data;
    List<Categorymodal> dategategory = gategorydate
        .map((e) => Categorymodal.fromJson(e))
        .toList();
    dategategory.insert(0, Categorymodal(id: 0, name: "ALL"));
    return dategategory;
  }
}
