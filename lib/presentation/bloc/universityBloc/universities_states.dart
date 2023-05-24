// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';
import 'package:new_project/domain/entities/university.dart';

abstract class UniversitiesState extends Equatable {
  const UniversitiesState();

  @override
  List<Object> get props => [];
}

class UniversitiesInitial extends UniversitiesState {}

class UniversitiesLoading extends UniversitiesState {}

class UniversitiesLoaded extends UniversitiesState {
  final List<University> universities;

  const UniversitiesLoaded({required this.universities});

  @override
  List<Object> get props => [universities];
}

class UniversitiesError extends UniversitiesState {
  final String message;

  const UniversitiesError({required this.message});

  @override
  List<Object> get props => [message];
}
