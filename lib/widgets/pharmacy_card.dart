import 'package:flutter/material.dart';
import 'package:ai_africa_camp_medicine_app/core/models/pharmacy.dart';
import 'package:go_router/go_router.dart';
import '../core/theme/app_theme.dart';

class PharmacyCard extends StatelessWidget {
  final Pharmacy pharmacy;
  const PharmacyCard({super.key, required this.pharmacy});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => context.go('/pharmacy/${pharmacy.id}'),
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: AppTheme.primary.withOpacity(0.12),
                child: Text(
                  pharmacy.name.isNotEmpty
                      ? pharmacy.name[0].toUpperCase()
                      : 'P',
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pharmacy.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      pharmacy.address,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                pharmacy.visible ? Icons.visibility : Icons.visibility_off,
                color: pharmacy.visible
                    ? AppTheme.success
                    : AppTheme.textSecondary,
              ),
              const SizedBox(width: 4),
              const Icon(Icons.chevron_right, color: AppTheme.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}
