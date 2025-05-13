import 'package:app/features/questions/presentation/views/widgets/text_button_pop_up_menu_gender.dart';
import 'package:flutter/material.dart';

class PopUpMenuGender extends StatefulWidget {
  const PopUpMenuGender({
    super.key,
    required this.genderMenuItems, this.onSelected,
  });
  final Function(String)? onSelected;

  final List<PopupMenuItem<String>> genderMenuItems;

  @override
  State<PopUpMenuGender> createState() => _PopUpMenuGenderState();
}

class _PopUpMenuGenderState extends State<PopUpMenuGender> {
  String? txt;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(-100, 50),
      color: Colors.white,
      itemBuilder: (context) => widget.genderMenuItems,
      onSelected: widget.onSelected,
      child: TextButtonPopUpMenuGender(
        txt: txt,
      ),
    );
  }
}
