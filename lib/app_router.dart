import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_africa_camp_medicine_app/features/search/pages/search_page.dart';
import 'package:ai_africa_camp_medicine_app/features/search/pages/search_results_page.dart';
import 'package:ai_africa_camp_medicine_app/features/medicine/pages/medicine_detail_page.dart';
import 'package:ai_africa_camp_medicine_app/features/pharmacy/pages/pharmacy_detail_page.dart';
import 'package:ai_africa_camp_medicine_app/features/admin/pages/admin_login_page.dart';
import 'package:ai_africa_camp_medicine_app/features/admin/pages/admin_dashboard_page.dart';
import 'package:ai_africa_camp_medicine_app/features/medicines/pages/medicines_list_page.dart';
import 'package:ai_africa_camp_medicine_app/features/medicines/pages/add_edit_medicine_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SearchPage()),
    GoRoute(path: '/search', builder: (context, state) => const SearchPage()),
    GoRoute(
      path: '/search/results',
      builder: (context, state) => const SearchResultsPage(),
    ),
    GoRoute(
      path: '/medicine/:id',
      builder: (context, state) => MedicineDetailPage(id: state.pathParameters['id'] ?? ''),
    ),
    GoRoute(
      path: '/pharmacy/:id',
      builder: (context, state) => PharmacyDetailPage(id: state.pathParameters['id'] ?? ''),
    ),
    GoRoute(
      path: '/admin/login',
      builder: (context, state) => const AdminLoginPage(),
    ),
    GoRoute(
      path: '/admin/dashboard',
      builder: (context, state) => const AdminDashboardPage(),
    ),
    GoRoute(
      path: '/admin/medicines',
      builder: (context, state) => const MedicinesListPage(),
    ),
    GoRoute(
      path: '/admin/medicines/add',
      builder: (context, state) => const AddEditMedicinePage(),
    ),
  ],
);
