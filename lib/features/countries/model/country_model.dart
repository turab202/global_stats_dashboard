class CountryModel {
  final String name;
  final String flag;
  final int cases;
  final int deaths;
  final int recovered;

  CountryModel({
    required this.name,
    required this.flag,
    required this.cases,
    required this.deaths,
    required this.recovered,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['country'],
      flag: json['countryInfo']['flag'],
      cases: json['cases'],
      deaths: json['deaths'],
      recovered: json['recovered'],
    );
  }
}
