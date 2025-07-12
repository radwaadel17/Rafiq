import 'package:app/core/utlis/constants.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:app/features/sign%20up/domain/entity/user_signup_entity.dart';
import 'package:app/features/sign%20up/presentation/manager/signup%20cubit_doctor/sign_up_cubit.dart';
import 'package:app/features/sign%20up/presentation/manager/signup%20cubit_doctor/sign_up_states_cubit.dart';
import 'package:app/features/sign%20up/presentation/views/otp_verfication.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/consultion_fee_text_field.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/list_of_container_time.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/row_of_buttons.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/row_switcher_and_container.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/sign_up_custom_app_bar.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/subtitle_widget.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/text_column.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorAppointmentViewBody extends StatefulWidget {
  const DoctorAppointmentViewBody({super.key, required this.user});
  final UserSignupDoctorEntity user;

  @override
  State<DoctorAppointmentViewBody> createState() =>
      _DoctorAppointmentViewBodyState();
}

class _DoctorAppointmentViewBodyState extends State<DoctorAppointmentViewBody> {
  final List<Map<String, dynamic>> workingHours = [];

  void updateDayData(Map<String, dynamic> dayData) {
    setState(() {
      int index = workingHours
          .indexWhere((element) => element["day"] == dayData["day"]);
      if (index != -1) {
        workingHours[index] = dayData;
      } else {
        workingHours.add(dayData);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
       if (state is SignupFaluireState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Align(
                  alignment: Alignment.centerLeft,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(state.errorMsg))),
            ),
          );
        } else if (state is SignupSuccesesState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: greenColor,
              content: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('User successfully created')),
            ),
          );
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return OtpVarfication(user: state.user);
              },
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SignUpCustomAppBar(imgPath: Assets.images.load1.path),
            ),
            const SliverToBoxAdapter(
              child: TextColumn(
                txt: 'إدراة المواعيد المتاحة',
                txt2:
                    'سيتوجب عليك تحديد المواعيد المتاحة لك سواء اونلاين او في العيادة',
              ),
            ),
            const SubtitleWidget(txt: 'نوع الموعد'),
            const SliverToBoxAdapter(child: Buttons()),
            const SubtitleWidget(txt: 'رسوم الأستشارة'),
            const ConsultionFeeTextField(),
            const SubtitleWidget(txt: 'نبذة عنك'),
            SliverToBoxAdapter(
              child: AboutTextField(
                onChanged: (data) {
                  widget.user.description = data;
                  //print("📝 Description: ${widget.user.description}");
                },
              ),
            ),
            const SubtitleWidget(txt: 'موقع العيادة'),
            SliverToBoxAdapter(
              child: LocationTextField(
                onChanged: (data) {
                  widget.user.clinicLocation = data;
                  //print("📍 Clinic Location: ${widget.user.clinicLocation}");
                },
              ),
            ),
            const SubtitleWidget(txt: 'مدة الموعد'),
            const ListTimeContainer(),
            const SubtitleWidget(txt: 'ساعات العمل المتاحة'),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  RowSwitcherAndContainer(
                      day: 'الأحد', onChanged: updateDayData),
                  RowSwitcherAndContainer(
                      day: 'الاثنين', onChanged: updateDayData),
                  RowSwitcherAndContainer(
                      day: 'الثلاثاء', onChanged: updateDayData),
                  RowSwitcherAndContainer(
                      day: 'الأربعاء', onChanged: updateDayData),
                  RowSwitcherAndContainer(
                      day: 'الخميس', onChanged: updateDayData),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomButton(
                  check: state is SignUpLoadingStatesCubit ? true : false,
                  text: 'تأكيد',
                  onPressed: () {
                    widget.user.appointments = workingHours;
                    
                    widget.user.rating = 0;
                    BlocProvider.of<SignUpCubit>(context).signUp(widget.user);
                    print('Name: ${widget.user.name}');
                    print('Email: ${widget.user.email}');
                    print('Password: ${widget.user.passowrd}');
                    print(
                        'Password Confirmation: ${widget.user.passwordConfirmation}');
                    print('Phone Number: ${widget.user.phoneNumber}');
                    print('Role: ${widget.user.role}');
                    print('Specialization: ${widget.user.specialization}');
                    print(
                        'Identity Verification: ${widget.user.identityVerification}');
                    print('Selfie Photo: ${widget.user.selfiePhoto}');
                    print('Description: ${widget.user.description}');
                    print('Clinic Location: ${widget.user.clinicLocation}');
                    print('Appointments: ${widget.user.appointments}');
                    print('Rating: ${widget.user.rating}'); 
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 50.h)),
          ],
        );
      },
    );
  }
}

class AboutTextField extends StatelessWidget {
  const AboutTextField({super.key, required this.onChanged});
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: TextFormField(
        onChanged: onChanged,
        minLines: 4,
        maxLines: 6,
        decoration: InputDecoration(
          hintText: 'اكتب نبذة قصيرة عن خبراتك ومجال عملك...',
          filled: true,
          fillColor: secondaryColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class LocationTextField extends StatelessWidget {
  const LocationTextField({super.key, this.onChanged});
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'ادخل عنوان العيادة',
          filled: true,
          fillColor: secondaryColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
