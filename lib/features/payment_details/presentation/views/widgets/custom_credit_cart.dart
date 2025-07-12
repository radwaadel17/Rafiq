import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({super.key});

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';

  bool showBackView = false;

  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: showBackView,
              onCreditCardWidgetChange: (value) {}),
          Directionality(
            textDirection: TextDirection.ltr,
            child: CreditCardForm(
                
                autovalidateMode: autovalidateMode,
                isHolderNameVisible: true,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                
                // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                onCreditCardModelChange: (CreditCardModel) {
                  cardNumber = CreditCardModel.cardNumber;
                  expiryDate = CreditCardModel.expiryDate;
                  cvvCode = CreditCardModel.cvvCode;
                  showBackView = CreditCardModel.isCvvFocused;
                  cardHolderName = CreditCardModel.cardHolderName;
                  
                  setState(() {});
                },
                formKey: formKey),
          ),
          const Spacer(
            flex: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: context.screenWidth,
              child: CustomButton(text: 'دفع', onPressed: () {
                if (formKey.currentState!.validate()) {
                  autovalidateMode = AutovalidateMode.disabled;
                 
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
                setState(() {});
              }),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
