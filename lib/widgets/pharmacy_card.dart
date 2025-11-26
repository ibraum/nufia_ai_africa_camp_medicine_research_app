import 'package:flutter/material.dart';
import 'package:ai_africa_camp_medicine_app/core/models/pharmacy.dart';
import 'package:go_router/go_router.dart';

class PharmacyCard extends StatelessWidget {
  final Pharmacy pharmacy;
  const PharmacyCard({super.key, required this.pharmacy});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(pharmacy.name),
        subtitle: Text(pharmacy.address),
        trailing: Icon(
          pharmacy.visible ? Icons.visibility : Icons.visibility_off,
        ),
        onTap: () => context.go('/pharmacy/${pharmacy.id}'),
      ),
    );
  }
}
