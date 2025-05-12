import 'package:app/features/questions/domain/qs_entity.dart';
import 'package:app/features/questions/presentation/views/widgets/relation_view_body.dart';
import 'package:flutter/material.dart';

class RelationView extends StatelessWidget {
  const RelationView({super.key, required this.qsEntity});
 final QsEntity qsEntity ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: RelationViewBody(qsEntity: qsEntity,),
    );
  }
}