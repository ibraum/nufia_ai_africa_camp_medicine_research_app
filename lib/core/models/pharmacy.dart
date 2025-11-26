class Pharmacy {
  final String id;
  final String name;
  final String address;
  final String phone;
  final bool visible;

  Pharmacy({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.visible,
  });

  factory Pharmacy.fromJson(Map<String, dynamic> json) => Pharmacy(
    id: json['id'] as String,
    name: json['name'] as String,
    address: json['address'] as String? ?? '',
    phone: json['phone'] as String? ?? '',
    visible: json['visible'] as bool? ?? true,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'address': address,
    'phone': phone,
    'visible': visible,
  };
}
