import 'package:app/features/payment_details/presentation/views/widgets/container_payment.dart';
import 'package:flutter/material.dart';

class PaymentContainerListView extends StatefulWidget {
  const PaymentContainerListView({
    super.key,
  });

  @override
  State<PaymentContainerListView> createState() =>
      _PaymentContainerListViewState();
}

class _PaymentContainerListViewState extends State<PaymentContainerListView> {
  List<String> images = [
    
  ];
  int activeIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                activeIndex = index; 
                setState(() {
                  
                });
              },
              child: ContainerPayment(
                index: activeIndex == index,
                image: images[index],
              ),
            );
          }),
    );
  }
}
