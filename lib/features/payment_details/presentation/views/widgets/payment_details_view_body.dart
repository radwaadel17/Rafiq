import 'package:app/core/widgets/custom_app_bar.dart';
import 'package:app/features/payment_details/presentation/views/widgets/custom_credit_cart.dart';
import 'package:flutter/material.dart';

class PaymentDetailsBody extends StatelessWidget {
  const PaymentDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(txt:'تفاصيل الدفع'),
        //PaymentContainerListView(),
        CustomCreditCard(),
      
      ],
    );
  }
}

