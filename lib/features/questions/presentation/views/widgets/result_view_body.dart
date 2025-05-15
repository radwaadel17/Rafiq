import 'package:app/features/questions/domain/entity/qs_entity.dart';
import 'package:app/features/questions/presentation/views/widgets/cat_photo.dart';
import 'package:app/features/questions/presentation/views/widgets/giraffe_photo.dart';
import 'package:app/features/questions/presentation/views/widgets/result_container.dart';
import 'package:flutter/material.dart';

class ResultViewBody extends StatelessWidget {
  const ResultViewBody({super.key, required this.qsEntity});
  final QsEntity qsEntity;
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Results(
          res: '',
          probality: 89.00,
        ),
        CatPhoto(),
        GiraffePhoto(),
      ],
    );
  }
}
