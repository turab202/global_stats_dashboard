import 'package:flutter/material.dart';

import '../../covid/ui/covid_dashboard_page.dart';

class HealthOverviewPage extends StatelessWidget {
  const HealthOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Health Overview')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Global Health Data',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            Text(
              'Explore health-related statistics including pandemics and '
              'infectious diseases.',
            ),
            const SizedBox(height: 24),

            Card(
              child: ListTile(
                leading: const Icon(Icons.coronavirus),
                title: const Text('COVID-19 Statistics'),
                subtitle: const Text('Cases, deaths, recoveries, charts'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CovidDashboardPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
