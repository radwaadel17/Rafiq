import 'package:app/features/sign%20up/presentation/views/widgets/text_button_pop_up_menu.dart';
import 'package:flutter/material.dart';

class PopUpmenu extends StatefulWidget {
  const PopUpmenu({super.key, required this.items, required this.ch});
  final List<PopupMenuItem<String>> items;
  final bool ch ;

  @override
  State<PopUpmenu> createState() => _PopUpmenuState();
}

class _PopUpmenuState extends State<PopUpmenu> {
  String? txt;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        txt = value;
        setState(() {
          
        });
      },
      itemBuilder: (context) => widget.items,
      child: TextButtonPopUpMenu( txt: txt, ch: widget.ch,),
    );
  }
}
