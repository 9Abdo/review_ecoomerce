class AddToCartModel {
  final int id;

  AddToCartModel({required this.id});

  factory AddToCartModel.fromJson(Map<String, dynamic> json) {
    return AddToCartModel(id: json['id']);
  }
}
