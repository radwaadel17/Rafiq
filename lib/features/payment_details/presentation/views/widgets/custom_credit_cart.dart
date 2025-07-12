import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/device_size.dart';
import 'package:app/core/utlis/text_style.dart';
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
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: showBackView,
                  onCreditCardWidgetChange: (value) {},
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: CreditCardForm(
                    autovalidateMode: autovalidateMode,
                    isHolderNameVisible: true,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    onCreditCardModelChange: (CreditCardModel) {
                      setState(() {
                        cardNumber = CreditCardModel.cardNumber;
                        expiryDate = CreditCardModel.expiryDate;
                        cvvCode = CreditCardModel.cvvCode;
                        showBackView = CreditCardModel.isCvvFocused;
                        cardHolderName = CreditCardModel.cardHolderName;
                      });
                    },
                    formKey: formKey,
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 40,
                        child: Image.asset('assets/images/Frame 273.png'),
                      ),
                      const SizedBox(width: 10),
                      Text('الدفع باستخدام Google pay', style: Styles.textstyle16),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 40,
                        child: Image.asset('assets/images/Frame 274.png'),
                      ),
                      const SizedBox(width: 10),
                      Text('الدفع باستخدام PayPal', style: Styles.textstyle16),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: context.screenWidth,
                    child: CustomButton(
                      text: 'دفع',
                      onPressed: () {
                        if (formKey.currentState!.validate() &&
                            cardNumber.isNotEmpty &&
                            expiryDate.isNotEmpty &&
                            cardHolderName.isNotEmpty &&
                            cvvCode.isNotEmpty) {
                          autovalidateMode = AutovalidateMode.disabled;
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return const Center(
                                child: AnimatedScale(
                                  scale: 1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeOutBack,
                                  child: const PaymentSuccessDialog(),
                                ),
                              );
                            },
                          );
                          
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                        
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/payment.png', height: 120),
            const SizedBox(height: 16),
            Text('تم الدفع بنجاح', style: Styles.textstyle18),
            const SizedBox(height: 8),
          const Text(
              'تهانينا! لقد حجزت بنجاح يوم 12 يوليو 2025',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 8),
            _infoRow('موعد الدفع', '12 يوليو 2025'),
            _infoRow('المبلغ', '600 ج'),
            _infoRow('طريقة الدفع', 'PayPal'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorApp,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'الذهاب للصفحة الرئيسية',
                style: Styles.textstyle14.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Styles.textstyle14),
          Text(value, style: Styles.textstyle14),
        ],
      ),
    );
  }
}