import 'package:app/core/utlis/device_size.dart';
import 'package:app/features/sign%20up/presentation/views/widgets/container_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTimeContainer extends StatefulWidget {
  const ListTimeContainer({
    super.key,
  });

  @override
  State<ListTimeContainer> createState() => _ListTimeContainerState();
}

class _ListTimeContainerState extends State<ListTimeContainer> {
  int? ch ;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: SizedBox(
      height: context.screenHeight * 0.05,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children:  [
              ContainerTime(
                selectedIndex: ch == 0,
                onPressed: (){
                  setState(() {
                    ch = 0 ;
                  });
                },
                txt: '15 دقيقة',
              ),
              ContainerTime(
                selectedIndex: ch == 1,
                onPressed: (){
                  setState(() {
                    ch = 1 ;
                  });
                },
                txt: '30 دقيقة',
              ),
              ContainerTime(
                selectedIndex: ch == 2,
                txt: '60 دقيقة',
                onPressed: (){
                  setState(() {
                    ch = 2 ;
                  });
                },
              ),
             ContainerTime(
                selectedIndex: ch == 3,
                txt: "مخصص",
                onPressed: (){
                  setState(() {
                    ch = 3 ;
                  });
                },
              ),
            ],
          )),
    ));
  }
}