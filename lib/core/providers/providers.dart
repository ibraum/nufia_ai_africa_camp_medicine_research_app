import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_africa_camp_medicine_app/core/services/mock_data_service.dart';
import 'package:ai_africa_camp_medicine_app/core/models/medicine.dart';
import 'package:ai_africa_camp_medicine_app/core/models/pharmacy.dart';

final mockDataServiceProvider = Provider<MockDataService>(
  (ref) => MockDataService(),
);

final medicinesProvider = FutureProvider<List<Medicine>>((ref) async {
  final svc = ref.watch(mockDataServiceProvider);
  return svc.loadMedicines();
});

final pharmaciesProvider = FutureProvider<List<Pharmacy>>((ref) async {
  final svc = ref.watch(mockDataServiceProvider);
  return svc.loadPharmacies();
});

final searchQueryProvider = StateProvider<String>((ref) => '');
