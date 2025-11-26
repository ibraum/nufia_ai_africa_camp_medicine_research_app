import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_africa_camp_medicine_app/core/providers/providers.dart';
import 'package:ai_africa_camp_medicine_app/widgets/medicine_card.dart';

class SearchResultsPage extends ConsumerWidget {
  const SearchResultsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchQueryProvider);
    final medsAsync = ref.watch(medicinesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Search Results')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: medsAsync.when(
          data: (meds) {
            final filtered = meds
                .where(
                  (m) => m.name.toLowerCase().contains(query.toLowerCase()),
                )
                .toList();
            if (filtered.isEmpty) {
              return Center(child: Text('No results for "${query}"'));
            }
            return ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) =>
                  MedicineCard(medicine: filtered[index]),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => Center(child: Text('Error loading results')),
        ),
      ),
    );
  }
}
