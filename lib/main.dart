import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:new_project/data/datasource/universities_remote_data_source.dart';
import 'package:new_project/data/repositories/university_repository_implementation.dart';
import 'package:new_project/domain/usecases/get_universities.dart';
import 'package:new_project/presentation/pages/university_page.dart';

import 'presentation/bloc/universityBloc/universities_bloc.dart';

void main() {
  final httpClient = http.Client();
  final remoteDataSource = UniversitiesRemoteDataSourceImpl(client: httpClient);
  final UniversitiesRepository universitiesRepository =
      UniversitiesRepositoryImpl(remoteDataSource: remoteDataSource);
  final getUniversities = GetUniversities(universitiesRepository);
  final universitiesBloc = UniversitiesBloc(getUniversities);

  runApp(MyApp(
    universitiesBloc: universitiesBloc,
  ));
}

class MyApp extends StatelessWidget {
  final UniversitiesBloc universitiesBloc;

  const MyApp({Key? key, required this.universitiesBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<UniversitiesBloc>(
        create: (context) => universitiesBloc,
        child: const UniversitiesPage(),
      ),
    );
  }
}
