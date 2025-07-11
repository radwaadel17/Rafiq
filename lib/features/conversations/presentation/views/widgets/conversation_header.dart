import 'package:app/core/widgets/app_input.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConversationHeader extends StatelessWidget {
  const ConversationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 16),
            child: AppInput(
              onChanged: (data) {},
              controller: TextEditingController(),
              hintText: 'البحث عن محادثة',
              suffixIcon: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  Assets.icons.search,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SvgPicture.asset(
            Assets.images.arrowBack,
          ),
        ),
      ],
    );
  }
}
