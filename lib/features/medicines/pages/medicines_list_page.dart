import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_africa_camp_medicine_app/core/providers/providers.dart';
import 'package:ai_africa_camp_medicine_app/widgets/medicine_card.dart';

class MedicinesListPage extends ConsumerWidget {
  const MedicinesListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medsAsync = ref.watch(medicinesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Medicines')),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed('/admin/medicines/add'),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: medsAsync.when(
          data: (meds) => ListView.builder(
            itemCount: meds.length,
            itemBuilder: (context, index) =>
                MedicineCard(medicine: meds[index]),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => const Center(child: Text('Error')),
        ),
      ),
    );
  }
}
