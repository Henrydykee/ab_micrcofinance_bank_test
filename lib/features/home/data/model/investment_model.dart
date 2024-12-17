class InvestmentModel {
  final String name;
  final int pricePerUnit;
  final String status;
  final String image;
  final String yield;
  final String type;

  InvestmentModel({
    required this.name,
    required this.pricePerUnit,
    required this.status,
    required this.image,
    required this.yield,
    required this.type,
  });

  factory InvestmentModel.fromJson(Map<String, dynamic> json) {
    return InvestmentModel(
      name: json['name'] as String,
      pricePerUnit: json['pricePerUnit'] as int,
      status: json['status'] as String,
      image: json['image'] as String,
      yield: json['yield'] as String,
      type: json['type'] as String,
    );
  }
}
