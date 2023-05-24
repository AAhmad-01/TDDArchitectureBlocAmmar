// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:new_project/domain/usecases/get_universities.dart';
import 'package:new_project/presentation/bloc/universityBloc/universities_event.dart';
import 'package:new_project/presentation/bloc/universityBloc/universities_states.dart';

class UniversitiesBloc extends Bloc<UniversitiesEvent, UniversitiesState> {
  final GetUniversities getUniversities;

  UniversitiesBloc(this.getUniversities) : super(UniversitiesInitial()) {
    on<FetchUniversitiesByCountry>(_fetchUniversitiesByCountry);
  }

  void _fetchUniversitiesByCountry(
      FetchUniversitiesByCountry event, Emitter<UniversitiesState> emit) async {
    emit(UniversitiesLoading());
    try {
      final universities = await getUniversities(event.country);
      emit(UniversitiesLoaded(universities: universities));
    } catch (e) {
      emit(const UniversitiesError(message: 'Failed to fetch universities'));
    }
  }
}
