// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';

abstract class UniversitiesEvent extends Equatable {
  const UniversitiesEvent();

  @override
  List<Object> get props => [];
}

class FetchUniversitiesByCountry extends UniversitiesEvent {
  final String country;

  const FetchUniversitiesByCountry(this.country);

  @override
  List<Object> get props => [country];
}
