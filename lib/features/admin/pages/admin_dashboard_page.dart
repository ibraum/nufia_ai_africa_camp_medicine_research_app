import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_africa_camp_medicine_app/core/theme/app_theme.dart';
import 'package:ai_africa_camp_medicine_app/core/providers/providers.dart';

class AdminDashboardPage extends ConsumerWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final medsAsync = ref.watch(medicinesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Tableau de bord Admin')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Card
              Card(
                color: AppTheme.primary,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bienvenue!',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Gérez vos médicaments et vérifiez vos stocks',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // KPI Cards
              Text(
                'Statistiques',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),

              // Total Medicines KPI
              medsAsync.when(
                data: (meds) {
                  final totalMeds = meds.length;
                  final inStock = meds.where((m) => m.stock > 0).length;
                  final outOfStock = meds.where((m) => m.stock == 0).length;

                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.medication,
                                      color: AppTheme.primary,
                                      size: 32,
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Total',
                                      style: Theme.of(context).textTheme.labelSmall,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '$totalMeds',
                                      style: Theme.of(context).textTheme.displayMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: AppTheme.success,
                                      size: 32,
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'En stock',
                                      style: Theme.of(context).textTheme.labelSmall,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '$inStock',
                                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                            color: AppTheme.success,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Icon(
                                Icons.warning_amber,
                                color: AppTheme.warning,
                                size: 32,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rupture',
                                      style: Theme.of(context).textTheme.labelSmall,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '$outOfStock',
                                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                            color: AppTheme.warning,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (e, st) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 24),

              // Actions
              Text(
                'Actions',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),

              // Manage Medicines Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () => context.go('/admin/medicines'),
                  icon: const Icon(Icons.local_pharmacy),
                  label: const Text('Gérer les médicaments'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Add Medicine Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton.icon(
                  onPressed: () => context.go('/admin/medicines/add'),
                  icon: const Icon(Icons.add),
                  label: const Text('Ajouter un médicament'),
                ),
              ),
              const SizedBox(height: 12),

              // Logout Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: TextButton(
                  onPressed: () => context.go('/'),
                  child: const Text('Se déconnecter'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
