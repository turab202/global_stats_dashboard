import 'package:flutter/material.dart';

class CovidDashboardPage extends StatelessWidget {
  const CovidDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COVID-19 Dashboard'),
      ),
      body: const Center(
        child: Text(
          'COVID-19 Global Statistics\n(Coming next)',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
