// ignore_for_file: deprecated_member_use

import 'package:app/core/utlis/constants.dart';
import 'package:app/core/utlis/text_style.dart';
import 'package:app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class MessagesHeader extends StatelessWidget {
  const MessagesHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorApp,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  const Gap(4),
                  SvgPicture.asset(
                    Assets.icons.video,
                  ),
                  const Gap(8),
                  SvgPicture.asset(
                    Assets.icons.phone,
                    color: Colors.white,
                  ),
                ],
              ),
              Text(
                "محمد أحمد",
                style: Styles.textstyle18.copyWith(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SvgPicture.asset(
                  Assets.icons.arrowBack,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
