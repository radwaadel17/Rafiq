import 'package:app/features/questions/domain/entity/qs_entity.dart';
import 'package:app/features/questions/presentation/views/widgets/result_view_body.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.qsEntity});
  final QsEntity qsEntity;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  ResultViewBody(qsEntity:qsEntity,),
    );
  }
}