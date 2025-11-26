import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_africa_camp_medicine_app/core/providers/providers.dart';

class PharmacyDetailPage extends ConsumerWidget {
  final String id;
  const PharmacyDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopsAsync = ref.watch(pharmaciesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Pharmacy Detail')),
      body: shopsAsync.when(
        data: (shops) {
          final shop = shops.firstWhere((s) => s.id == id, orElse: () => shops.first);
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(shop.name, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text(shop.address),
                const SizedBox(height: 8),
                Text('Phone: ${shop.phone}'),
                const SizedBox(height: 12),
                Row(children: [
                  const Text('Visible in search:'),
                  const SizedBox(width: 8),
                  Switch(value: shop.visible, onChanged: (v) {}),
                ])
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error loading pharmacy')),
      ),
    );
  }
}
