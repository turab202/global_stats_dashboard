import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/country_model.dart';

final countryProvider = FutureProvider<List<CountryModel>>((ref) async {
  final response = await Dio().get(
    'https://corona.lmao.ninja/v2/countries?sort=cases',
  );

  return (response.data as List)
      .map((e) => CountryModel.fromJson(e))
      .toList();
});
