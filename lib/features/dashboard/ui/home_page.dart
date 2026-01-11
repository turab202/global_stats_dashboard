import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../widgets/stat_card.dart';
import '../widgets/chart_panel.dart';

// --- Riverpod Provider for global stats ---
final globalStatsProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  try {
    final response =
        await dio.get('https://disease.sh/v3/covid-19/all');

    if (response.statusCode == 200) {
      return Map<String, dynamic>.from(response.data);
    } else {
      throw Exception('API error');
    }
  } catch (e) {
    throw Exception('Network error');
  }
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(globalStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Stats Dashboard'),
      ),
      body: statsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => const Center(
          child: Text(
            'Error loading data.\nCheck internet connection.',
            textAlign: TextAlign.center,
          ),
        ),
        data: (data) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(globalStatsProvider);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    title: 'Recovered',
                    count: data['recovered'].toString(),
                    color: Colors.green,
                  ),
                  const SizedBox(height: 24),
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
