import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ConversationItem extends StatelessWidget {
  const ConversationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.asset(
            Assets.images.userAvatar.path,
            height: 40,
          ),
          const Gap(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "محمد أحمد",
                  style: Styles.textstyle16,
                ),
                const Gap(4),
                Text(
                  "من حوالي ٣ شهور.    1 س",
                  style: Styles.textstyle12.copyWith(
                    color: hintColor,
                  ),
                )
              ],
            ),
          ),
          SvgPicture.asset(
            Assets.icons.done,
          ),
        ],
      ),
    );
  }
}
