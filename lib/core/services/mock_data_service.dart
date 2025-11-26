import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ai_africa_camp_medicine_app/core/models/medicine.dart';
import 'package:ai_africa_camp_medicine_app/core/models/pharmacy.dart';

class MockDataService {
  Future<List<Medicine>> loadMedicines() async {
    final raw = await rootBundle.loadString('assets/mock/medicines.json');
    final List list = json.decode(raw) as List;
    return list
        .map((e) => Medicine.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<Pharmacy>> loadPharmacies() async {
    final raw = await rootBundle.loadString('assets/mock/pharmacies.json');
    final List list = json.decode(raw) as List;
    return list
        .map((e) => Pharmacy.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
