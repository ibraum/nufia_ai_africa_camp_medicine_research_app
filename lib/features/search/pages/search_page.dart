import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_africa_camp_medicine_app/core/providers/providers.dart';
import 'package:ai_africa_camp_medicine_app/core/theme/app_theme.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchQueryProvider);
    final controller = TextEditingController(text: query);

    return Scaffold(
      appBar: AppBar(title: const Text('Chercher un médicament')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Box
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Nom du médicament, mot-clé...',
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (v) =>
                    ref.read(searchQueryProvider.notifier).state = v,
                onSubmitted: (v) {
                  ref.read(searchQueryProvider.notifier).state = v;
                  context.go('/search/results');
                },
              ),
              const SizedBox(height: 16),

              // Search Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go('/search/results'),
                  child: const Text('Rechercher'),
                ),
              ),
              const SizedBox(height: 28),

              // Suggestions Header
              Text(
                'Suggestions populaires',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),

              // Suggestion Chips
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _buildSuggestionChip(context, ref, 'Paracétamol'),
                  _buildSuggestionChip(context, ref, 'Ibuprofène'),
                  _buildSuggestionChip(context, ref, 'Amoxicilline'),
                  _buildSuggestionChip(context, ref, 'Aspirine'),
                ],
              ),
              const SizedBox(height: 32),

              // Recent Searches Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recherches récentes',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Paracétamol • Ibuprofène • Aspirine',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestionChip(
    BuildContext context,
    WidgetRef ref,
    String label,
  ) {
    return FilterChip(
      label: Text(label),
      onSelected: (selected) {
        ref.read(searchQueryProvider.notifier).state = label;
        context.go('/search/results');
      },
      backgroundColor: Colors.white,
      selectedColor: AppTheme.primary.withOpacity(0.12),
      side: const BorderSide(color: AppTheme.border, width: 1),
    );
  }
}
