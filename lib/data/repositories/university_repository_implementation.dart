import 'package:new_project/data/datasource/universities_remote_data_source.dart';
import 'package:new_project/domain/entities/university.dart';

abstract class UniversitiesRepository {
  Future<List<University>> getUniversitiesByCountry(String country);
}

class UniversitiesRepositoryImpl implements UniversitiesRepository {
  final UniversitiesRemoteDataSource remoteDataSource;

  UniversitiesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<University>> getUniversitiesByCountry(String country) async {
    try {
      final universityModels =
          await remoteDataSource.getUniversitiesByCountry(country);

      final universities = universityModels
          .map((model) => University(
                name: model.name,
                country: model.country,
                domain: model.domain,
              ))
          .toList();

      return universities;
    } catch (e) {
      throw Exception('Failed to fetch universities');
    }
  }
}
