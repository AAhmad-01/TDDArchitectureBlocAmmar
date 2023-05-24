import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/presentation/bloc/universityBloc/universities_bloc.dart';
import 'package:new_project/presentation/bloc/universityBloc/universities_states.dart';

class UniversitiesList extends StatelessWidget {
  const UniversitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UniversitiesBloc, UniversitiesState>(
      builder: (context, state) {
        if (state is UniversitiesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UniversitiesLoaded) {
          final universities = state.universities;
          return ListView.builder(
            itemCount: universities.length,
            itemBuilder: (context, index) {
              final university = universities[index];
              return ListTile(
                title: Text(university.name),
                subtitle: Text(university.country),
              );
            },
          );
        } else if (state is UniversitiesError) {
          return Center(child: Text(state.message));
        } else {
          return Container();
        }
      },
    );
  }
}
