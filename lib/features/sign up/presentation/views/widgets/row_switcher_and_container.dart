import 'package:app/core/utlis/text_style.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/pop_up_menu.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/unavailable_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowSwitcherAndContainer extends StatefulWidget {
  const RowSwitcherAndContainer({
    super.key,
    required this.day,
    required this.onChanged,
  });

  final String day;
  final void Function(Map<String, dynamic>) onChanged;

  @override
  State<RowSwitcherAndContainer> createState() =>
      _RowSwitcherAndContainerState();
}

class _RowSwitcherAndContainerState extends State<RowSwitcherAndContainer> {
  bool isSelected = false;
  String? selectedMorningTime;
  String? selectedEveningTime;

  List<PopupMenuItem<String>> itemsMorning = [];
  List<PopupMenuItem<String>> itemsEvening = [];

  void putItemsMornings() {
    itemsMorning.clear();
    for (int i = 1; i <= 12; i++) {
      itemsMorning.add(PopupMenuItem(
        value: '$i:00 صباحاً',
        child: Text(
          '$i:00 صباحاً',
          style: TextStyle(fontSize: 12.sp, color: Colors.blue),
        ),
      ));
    }
  }

  void putItemsEvenings() {
    itemsEvening.clear();
    for (int i = 1; i <= 12; i++) {
      itemsEvening.add(PopupMenuItem(
        value: '$i:00 مساءً',
        child: Text(
          '$i:00 مساءً',
          style: TextStyle(fontSize: 12.sp, color: Colors.blue),
        ),
      ));
    }
  }

  void sendData() {
    widget.onChanged({
      "day": widget.day,
      "available": isSelected,
      "morning": selectedMorningTime,
      "evening": selectedEveningTime,
    });
  }

  @override
  void initState() {
    super.initState();
    putItemsMornings();
    putItemsEvenings();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                value: isSelected,
                onChanged: (value) {
                  setState(() {
                    isSelected = value;
                  });
                  sendData();
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(widget.day, style: Styles.textstyle18),
            ),
          ),
          Expanded(
            flex: 2,
            child: isSelected
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 150.w,
                          child: PopUpmenu(
                            ch: true,
                            items: itemsMorning,
                            onSelected: (value) {
                              setState(() {
                                selectedMorningTime = value;
                              });
                              sendData();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 150.w,
                          child: PopUpmenu(
                            ch: false,
                            items: itemsEvening,
                            onSelected: (value) {
                              setState(() {
                                selectedEveningTime = value;
                              });
                              sendData();
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : const UnavalibaleContainer(),
          ),
        ],
      ),
    );
  }
}
