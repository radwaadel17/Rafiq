// ignore_for_file: prefer_const_constructors

import 'package:app/core/utlis/service_locator.dart';
import 'package:app/features/doctors/data/repos/doctors_repo_imp.dart';
import 'package:app/features/doctors/presentation/manager/doctors_cubit/doctors_cubit.dart';
import 'package:app/features/doctors/presentation/views/widgets/doctors_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorsCubit(getIt<DoctorsRepoImp>())..getDoctors(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: const [
                  // DoctorSreach(),
                  // Gap(8),
                  // RecommendedDoctorSection(),
                  // Gap(8),
                  DoctorsList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
