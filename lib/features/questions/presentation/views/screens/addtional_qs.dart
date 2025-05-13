import 'package:app/features/questions/domain/qs_entity.dart';
import 'package:app/features/questions/presentation/views/widgets/addtional_qs_body.dart';
import 'package:flutter/material.dart';

class AddtionalQsView extends StatelessWidget {
  const AddtionalQsView({super.key, required this.qsEntity});
  final QsEntity qsEntity ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AddtionalQsBody(qsEntity: qsEntity,),
    );
  }
}