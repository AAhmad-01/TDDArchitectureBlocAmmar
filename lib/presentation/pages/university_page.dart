// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/presentation/bloc/universityBloc/universities_bloc.dart';
import 'package:new_project/presentation/bloc/universityBloc/universities_event.dart';
import 'package:new_project/presentation/widgets/university_list.dart';

class UniversitiesPage extends StatelessWidget {
  const UniversitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final universitiesBloc = BlocProvider.of<UniversitiesBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Universities'),
      ),
      body: BlocProvider<UniversitiesBloc>(
        create: (_) => universitiesBloc,
        child: Column(
          children: [
            // Add UI components as needed
            ElevatedButton(
              onPressed: () {
                universitiesBloc
                    .add(const FetchUniversitiesByCountry('United States'));
              },
              child: const Text('Fetch Universities'),
            ),
            const Expanded(
              child: UniversitiesList(),
            ),
          ],
        ),
      ),
    );
  }
}
