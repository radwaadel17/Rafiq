import 'package:app/core/widgets/app_input.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class MessgeInput extends StatelessWidget {
  const MessgeInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16) + const EdgeInsets.only(top: 15, bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: AppInput(
                controller: TextEditingController(),
                onChanged: (data) {},
                hintText: 'اكتب رسالتك..',
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(
                    Assets.images.send,
                  ),
                ),
                fillColor: const Color(0xffE4E6F0),
                borderRadius: 50,
              ),
            ),
            const Gap(12),
            SvgPicture.asset(
              Assets.images.mic,
            ),
            const Gap(12),
            SvgPicture.asset(
              Assets.images.attach,
            ),
          ],
        ),
      ),
    );
  }
}
