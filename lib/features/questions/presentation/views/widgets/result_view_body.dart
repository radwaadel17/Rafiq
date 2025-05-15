import 'package:app/features/questions/domain/entity/result_entity.dart';
import 'package:app/features/questions/presentation/views/widgets/cat_photo.dart';
import 'package:app/features/questions/presentation/views/widgets/giraffe_photo.dart';
import 'package:app/features/questions/presentation/views/widgets/result_container.dart';
import 'package:flutter/material.dart';

class ResultViewBody extends StatelessWidget {
  const ResultViewBody({
    super.key, required this.resultEntity,
  });
  final ResultEntity resultEntity;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Results(resultEntity: resultEntity,),
        const CatPhoto(),
        const GiraffePhoto(),
      ],
    );
  }
}
