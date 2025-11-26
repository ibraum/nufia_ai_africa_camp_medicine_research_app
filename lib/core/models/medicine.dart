class Medicine {
  final String id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final String pharmacyId;

  Medicine({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.pharmacyId,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String? ?? '',
    price: (json['price'] as num?)?.toDouble() ?? 0.0,
    stock: json['stock'] as int? ?? 0,
    pharmacyId: json['pharmacyId'] as String? ?? '',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'stock': stock,
    'pharmacyId': pharmacyId,
  };
}
