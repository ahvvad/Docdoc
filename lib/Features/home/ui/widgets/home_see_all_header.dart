import 'package:docdoc/Core/theming/styles.dart';
import 'package:flutter/material.dart';

class HomeSeeAllHeader extends StatelessWidget {
  const HomeSeeAllHeader({
    super.key,
    required this.title,
    this.subtitle,
  });
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        const Spacer(),
        Text(
          subtitle ?? 'See All',
          style: TextStyles.font12BlueRegular,
        ),
      ],
    );
  }
}
