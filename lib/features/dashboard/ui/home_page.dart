import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../widgets/stat_card.dart';
import '../widgets/chart_panel.dart';
import '../../../core/theme/theme.dart';

// --- Riverpod Provider for global stats ---
final globalStatsProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  try {
    final response = await Dio().get('https://corona.lmao.ninja/v2/all');
    return response.data;
  } catch (e) {
    throw Exception('Failed to load global stats');
  }
});

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(globalStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Global Stats Dashboard'),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              // toggle theme using ThemeMode.system is for later
            },
          )
        ],
      ),
      body: statsAsync.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error loading data')),
        data: (data) {
          return RefreshIndicator(
            onRefresh: () async => ref.refresh(globalStatsProvider),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Animated Global Stats Cards ---
                  StatCard(
                    title: 'Total Cases',
                    count: data['cases'].toString(),
                    color: Colors.orange,
                  ),
                  StatCard(
                    title: 'Total Deaths',
                    count: data['deaths'].toString(),
                    color: Colors.redAccent,
                  ),
                  StatCard(
                    title: 'Total Recovered',
                    count: data['recovered'].toString(),
                    color: Colors.green,
                  ),
                  SizedBox(height: 20),
                  // --- Placeholder for Country Panel ---
                  Text(
                    'Regional Stats (Coming Next)',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(child: Text('Country panel will be here')),
                  ),
                  SizedBox(height: 20),
                  // --- Chart Panel (placeholder) ---
                  ChartPanel(data: data),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
