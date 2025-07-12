import 'package:app/features/sign%20up/presentation/views/widgets/text_button_pop_up_menu.dart';
import 'package:flutter/material.dart';

class PopUpmenu extends StatefulWidget {
  const PopUpmenu({super.key, required this.items, required this.ch, this.onSelected});
  final List<PopupMenuItem<String>> items;
  final bool ch ;
  final void Function(String)? onSelected;


  @override
  State<PopUpmenu> createState() => _PopUpmenuState();
}

class _PopUpmenuState extends State<PopUpmenu> {
  
  String? txt;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (context) => widget.items,
      onSelected: (value) {
        setState(() {
          txt = value; // 🟢 يظهر التوقيت المختار على الزر
        });

        if (widget.onSelected != null) {
          widget.onSelected!(value); // 🟢 يبعت القيمة للبرنت الخارجي
        }
      },
      child: TextButtonPopUpMenu(txt: txt, ch: widget.ch),
    );
  }
}
