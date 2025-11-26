import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_africa_camp_medicine_app/core/providers/providers.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchQueryProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Find Medicine')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search medicine by name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (v) =>
                  ref.read(searchQueryProvider.notifier).state = v,
              onSubmitted: (v) {
                ref.read(searchQueryProvider.notifier).state = v;
                context.go('/search/results');
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.go('/search/results'),
              child: const Text('Search'),
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Recent searches'),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                ActionChip(
                  label: const Text('Paracetamol'),
                  onPressed: () {
                    ref.read(searchQueryProvider.notifier).state =
                        'Paracetamol';
                    context.go('/search/results');
                  },
                ),
                ActionChip(
                  label: const Text('Amoxicillin'),
                  onPressed: () {
                    ref.read(searchQueryProvider.notifier).state =
                        'Amoxicillin';
                    context.go('/search/results');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
