import 'package:app/core/utlis/app_router.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/doctors/presentation/manager/doctors_cubit/doctors_cubit.dart';
import 'package:app/features/doctors/presentation/manager/doctors_cubit/doctors_cubit_state.dart';
import 'package:app/features/home/presentation/views/widgets/grid_doctor_item.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class PopularDoctorsSection extends StatelessWidget {
  const PopularDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsCubitState>(builder: (context, state) {
      if (state is DoctorsCubitLoadingState) {
        return const Center(
            child: Padding(
          padding: EdgeInsets.only(top: 50),
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
                Text(
                  "أشهر الاطباء",
                  style: Styles.textstyle18.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Gap(8),
            DynamicHeightGridView(
                itemCount: doctors.length,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(Approuter.doctorDetails);
                      },
                      child: GridDoctorItem(
                        doctor: doctors[index],
                      ));
                }),
          ],
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
