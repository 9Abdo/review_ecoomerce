class AddressModal {
  final String title;
  final String descrption;
  AddressModal({required this.title, required this.descrption});
  factory AddressModal.fromJson(Map<String, dynamic> json) {
    return AddressModal(title: json["name"], descrption: json["description"]);
  }
}
