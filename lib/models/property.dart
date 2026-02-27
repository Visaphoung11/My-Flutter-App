class Property {
  final String id;
  final String name;
  final String location;
  final String price;
  final String image;
  final String? description;
  final String? address;
  final String? electricityCost;
  final String? waterCost;
  final DateTime createdAt;

  Property({
    String? id,
    required this.name,
    required this.location,
    required this.price,
    required this.image,
    this.description,
    this.address,
    this.electricityCost,
    this.waterCost,
    DateTime? createdAt,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString(),
       createdAt = createdAt ?? DateTime.now();
}
