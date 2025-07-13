import 'package:app/core/utlis/service_locator.dart';
import 'package:app/features/doctors/data/repos/doctors_repo_imp.dart';
import 'package:app/features/doctors/presentation/manager/doctors_cubit/doctors_cubit.dart';
import 'package:app/features/home/presentation/views/widgets/home_header.dart';
import 'package:app/features/home/presentation/views/widgets/home_slider.dart';
import 'package:app/features/home/presentation/views/widgets/popular_doctors_section.dart';
import 'package:app/features/home/presentation/views/widgets/tasks_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorsCubit(getIt<DoctorsRepoImp>())..getDoctors(),
      child: const Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HomeHeader(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    children: [
                      HomeSlider(),
                      TasksSection(),
                      Gap(8),
                      PopularDoctorsSection(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
