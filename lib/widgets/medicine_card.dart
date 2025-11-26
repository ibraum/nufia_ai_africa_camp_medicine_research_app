import 'package:flutter/material.dart';
import 'package:ai_africa_camp_medicine_app/core/models/medicine.dart';
import 'package:go_router/go_router.dart';

class MedicineCard extends StatelessWidget {
  final Medicine medicine;
  const MedicineCard({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(medicine.name),
        subtitle: Text(
          '${medicine.description}\nStock: ${medicine.stock}  Price: ${medicine.price.toStringAsFixed(2)}',
        ),
        isThreeLine: true,
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.go('/medicine/${medicine.id}'),
      ),
    );
  }
}
