import 'package:new_project/domain/entities/university.dart';

abstract class UniversitiesRepository {
  Future<List<University>> getUniversitiesByCountry(String country);
}
