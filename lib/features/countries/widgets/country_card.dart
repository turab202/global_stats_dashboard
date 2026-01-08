import 'package:flutter/material.dart';
import '../model/country_model.dart';

class CountryCard extends StatelessWidget {
  final CountryModel country;

  const CountryCard({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(country.flag),
        ),
        title: Text(
          country.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Cases: ${country.cases}\nDeaths: ${country.deaths}\nRecovered: ${country.recovered}',
        ),
      ),
    );
  }
}
