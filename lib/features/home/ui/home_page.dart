import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Statistics Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome 👋',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'This app visualizes global data across multiple domains such as '
              'health, population, and countries. Explore insights using charts '
              'and real-time statistics.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),

            _InfoCard(
              icon: Icons.favorite,
              title: 'Health Statistics',
              subtitle: 'Diseases, pandemics, and global health data',
            ),
            _InfoCard(
              icon: Icons.public,
              title: 'Countries',
              subtitle: 'Country-wise statistics and comparisons',
            ),
            _InfoCard(
              icon: Icons.insights,
              title: 'More Domains',
              subtitle: 'Economy, environment, and more (coming soon)',
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
