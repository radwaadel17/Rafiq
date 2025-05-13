import 'package:app/features/questions/domain/qs_entity.dart';
import 'package:app/features/questions/presentation/views/widgets/country_view_body.dart';
import 'package:flutter/material.dart';

class CountryView extends StatelessWidget {
  const CountryView({super.key, required this.qsEntity});
  final QsEntity qsEntity ;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     body: CountryViewBody(),
    );
  }
}