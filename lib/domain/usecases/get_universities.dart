import 'package:new_project/data/repositories/university_repository_implementation.dart';
import 'package:new_project/domain/entities/university.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class GetUniversities implements UseCase<List<University>, String> {
  final UniversitiesRepository repository;

  GetUniversities(this.repository);

  @override
  Future<List<University>> call(String country) async {
    return await repository.getUniversitiesByCountry(country);
  }
}
