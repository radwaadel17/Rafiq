import 'package:app/features/questions/presentation/views/widgets/result_view_body.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  ResultViewBody(),
    );
  }
}