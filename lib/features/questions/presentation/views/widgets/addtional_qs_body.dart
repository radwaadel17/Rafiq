import 'package:app/features/questions/domain/qs_entity.dart';
import 'package:app/features/questions/presentation/views/widgets/cat_photo.dart';
import 'package:app/features/questions/presentation/views/widgets/giraffe_photo.dart';
import 'package:flutter/material.dart';

class AddtionalQsBody extends StatelessWidget {
  const AddtionalQsBody({super.key, required this.qsEntity});
  final QsEntity qsEntity;
  @override
  Widget build(BuildContext context) {
    return const Stack(
       children: [
        CatPhoto(),
        GiraffePhoto() ,
        
       ],
    );
  }
}