class UniversityModel {
  final String name;
  final String country;
  final String domain;

  UniversityModel({
    required this.name,
    required this.country,
    required this.domain,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
      name: json['name'] ??
          '', // Provide a default value if the property is nullable
      country: json['country'] ?? '', domain: '',
    );
  }
}
