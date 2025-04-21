import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/core/widgets/app_button.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  final List<String> texts = [
    'رِحلة التوحد مليئة بالتحديات، لكنها أيضًا مليئة باللحظات الجميلة. أنت أفضل داعم لطفلك!',
    'طفلك يرى العالم بطريقة فريدة، ودورك هو أن تساعده على التعبير عن رؤيته الرائعة!',
    'طفلك ليس مختلفًا، بل مميزٌ بطريقته الخاصة. مع الحب والفهم، يمكنه الوصول لأبعد الحدود!',
    'الحب والتفهم هما المفتاح. ثق بقدرات طفلك وشاهد كيف يصنع المستحيل!',
  ];
  final List<String> images = [
    Assets.images.slider1.path,
    Assets.images.slider2.path,
    Assets.images.slider3.path,
    Assets.images.slider4.path,
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: _controller,
      itemCount: texts.length,
      options: CarouselOptions(
        height: 150,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
      itemBuilder: (context, index, realIndex) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        texts[index],
                        style: Styles.textstyle16,
                        textAlign: TextAlign.center,
                      ),
                      const Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: texts.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: _current == entry.key ? 16 : 8,
                              height: 4,
                              margin: const EdgeInsets.symmetric(horizontal: 0.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: _current == entry.key ? colorApp : secondaryColor,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const Gap(8),
                      AppButton(
                        onTap: () {
                          context.go('/questions');
                        },
                        text: "لنبدأ الأن",
                        height: 35,
                      )
                    ],
                  ),
                ),
                const Gap(8),
                Image.asset(
                  images[index],
                  height: 135,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
