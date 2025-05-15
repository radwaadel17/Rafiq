import 'package:app/features/questions/domain/entity/qs_entity.dart';
import 'package:app/features/questions/presentation/views/widgets/gender_view_body.dart';
import 'package:flutter/material.dart';

class GenderView extends StatelessWidget {
  const GenderView({super.key, required this.qsEntity});
  final QsEntity qsEntity ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : GenderViewBody(qsEntity: qsEntity,),
    );
  }
}