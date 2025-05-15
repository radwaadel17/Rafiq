import 'package:app/features/questions/domain/entity/qs_entity.dart';
import 'package:app/features/questions/presentation/views/widgets/age_view_body.dart';
import 'package:flutter/material.dart';

class AgeView extends StatelessWidget {
  const AgeView({super.key, required this.qsEntity});
  final QsEntity qsEntity ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  AgeViewBody(qsEntity: qsEntity,),
    );
  }
}