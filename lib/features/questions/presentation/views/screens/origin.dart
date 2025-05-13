import 'package:app/features/questions/domain/qs_entity.dart';
import 'package:app/features/questions/presentation/views/widgets/origin_view_body.dart';
import 'package:flutter/material.dart';

class OrginView extends StatelessWidget {
  const OrginView({super.key, required this.qsEntity});
  final QsEntity qsEntity;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: OriginViewBody(qsEntity: qsEntity),
    );
  }
}
