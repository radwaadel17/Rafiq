import 'package:app/features/questions/domain/qs_entity.dart';
import 'package:flutter/material.dart';

class AddtionalQsView extends StatelessWidget {
  const AddtionalQsView({super.key, required this.qsEntity});
  final QsEntity qsEntity ;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Addtional Questions'),
      ),
    );
  }
}