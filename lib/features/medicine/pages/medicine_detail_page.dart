import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_africa_camp_medicine_app/core/providers/providers.dart';

class MedicineDetailPage extends ConsumerWidget {
  final String id;
  const MedicineDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medsAsync = ref.watch(medicinesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Medicine Detail')),
      body: medsAsync.when(
        data: (meds) {
          final med = meds.firstWhere(
            (m) => m.id == id,
            orElse: () => meds.first,
          );
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  med.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(med.description),
                const SizedBox(height: 12),
                Text('Price: ${med.price.toStringAsFixed(2)}'),
                const SizedBox(height: 8),
                Text('Stock: ${med.stock}'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('View Pharmacies'),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error loading medicine')),
      ),
    );
  }
}
