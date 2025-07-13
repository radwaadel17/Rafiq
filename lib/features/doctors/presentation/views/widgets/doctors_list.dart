import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/doctors/presentation/manager/doctors_cubit/doctors_cubit.dart';
import 'package:app/features/doctors/presentation/manager/doctors_cubit/doctors_cubit_state.dart';
import 'package:app/features/doctors/presentation/views/widgets/doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsCubitState>(
      builder: (context, state) {
        if (state is DoctorsCubitLoadingState) {
          return const Center(
              child: Padding(
            padding: EdgeInsets.only(top: 250),
            child: CircularProgressIndicator(),
          ));
        } else if (state is DoctorsCubitFaluireState) {
          return Center(child: Text(state.errorMessage));
        } else if (state is DoctorsCubitSucsessState) {
          final doctors = state.doctors;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("بعض الإقتراحات", style: Styles.textstyle16),
                ],
              ),
              const Gap(10),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: doctors.length,
                itemBuilder: (_, int index) {
                  final doctor = doctors[index];
                  return DoctorItem(doctor: doctor);
                },
                separatorBuilder: (BuildContext context, int index) => const Gap(4),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
