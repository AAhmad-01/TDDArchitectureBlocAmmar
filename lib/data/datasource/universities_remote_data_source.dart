import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:new_project/data/models/university_model.dart';

abstract class UniversitiesRemoteDataSource {
  Future<List<UniversityModel>> getUniversitiesByCountry(String country);
}

class UniversitiesRemoteDataSourceImpl implements UniversitiesRemoteDataSource {
  final http.Client client;

  UniversitiesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<UniversityModel>> getUniversitiesByCountry(String country) async {
    final url =
        Uri.parse('http://universities.hipolabs.com/search?country=$country');

    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        final universities =
            data.map((json) => UniversityModel.fromJson(json)).toList();

        return universities;
      } else {
        throw Exception('Failed to fetch universities');
      }
    } catch (e) {
      throw Exception('Failed to fetch universities');
    }
  }
}
