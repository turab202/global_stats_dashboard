import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/home/ui/home_overview_page.dart';
import 'features/health/ui/health_page.dart';
import 'features/countries/country_page.dart';
import 'features/trends/trends_page.dart';
import 'features/settings/settings_page.dart';
import 'core/theme/theme.dart';

void main() {
  runApp(const ProviderScope(child: GlobalStatsApp()));
}

class GlobalStatsApp extends StatefulWidget {
  const GlobalStatsApp({super.key});

  @override
  State<GlobalStatsApp> createState() => _GlobalStatsAppState();
}

class _GlobalStatsAppState extends State<GlobalStatsApp> {
  int _currentIndex = 0;

  final _pages = const [
    HomeOverviewPage(),
    HealthPage(),
    CountryPage(),
    TrendsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety),
              label: 'Health',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.public),
              label: 'Countries',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              label: 'Trends',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
