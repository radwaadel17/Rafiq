import 'package:app/features/sign%20up/presentation/views/widgets/consultion_fee_text_field.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/list_of_container_time.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/row_of_buttons.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/sign_up_custom_app_bar.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/subtitle_widget.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/text_column.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class DoctorAppointmentViewBody extends StatelessWidget {
  const DoctorAppointmentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
        const SubtitleWidget(
          txt: 'نوع الموعد',
        ),
        const SliverToBoxAdapter(
          child: Buttons(),
        ),
        const SubtitleWidget(
          txt: 'رسوم الأستشارة',
        ),
        const ConsultionFeeTextField(),
        const SubtitleWidget(
          txt: 'مدة الموعد',
        ),
        const ListTimeContainer(),
        const SubtitleWidget(
          txt: 'ساعات العمل المتاحة',
        ),
      ],
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/* class SimplePopupMenu extends StatefulWidget {
  @override
  State<SimplePopupMenu> createState() => _SimplePopupMenuState();
}
class _SimplePopupMenuState extends State<SimplePopupMenu> {
  String txt = 'افتح الثائمة';

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Align(
        alignment: Alignment.centerRight, // حسب مكان الزر اللي تحبيه
        child: PopupMenuButton<String>(
          onSelected: (value) {
            setState(() {
              txt = value;
            });
            print("Selected: $value");
          },
          itemBuilder: (context) => const [
            PopupMenuItem(value: 'option1', child: Text('اختيار 1')),
            PopupMenuItem(value: 'option2', child: Text('اختيار 2')),
          ],
          child: TextButton(
            onPressed: null,
            child: Text(txt),
          ),
        ),
      ),
    );
  }
}*/