class Categorymodal {
  final int id;
  final String name;
  Categorymodal({required this.id, required this.name});
  factory Categorymodal.fromJson(Map<String, dynamic> json) {
    return Categorymodal(id: json['id'], name: json['name']);
  }
}
