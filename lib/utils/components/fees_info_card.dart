import 'package:flutter/material.dart';
import '../../common_lib.dart';

class FeesInfoCard extends StatelessWidget {
  const FeesInfoCard({
    super.key,
    required this.title,
    required this.icon,
    required this.subTitle,
    required this.onIconPressed,
  });

  final String title;
  final int subTitle;
  final String icon;
  final Function()? onIconPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 170,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderSize.smallRadius),
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: Insets.small,
            top: Insets.medium,
            right: Insets.small,
            left: Insets.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: FontsTheme.mediumSize,
              ),
            ),
            const Gap(Insets.small),
            Text(
              '${subTitle}IQD',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontsTheme.bigWeight,
                fontSize: FontsTheme.bigSize,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: onIconPressed,
                  style: IconButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor),
                  icon: SvgPicture.asset(icon,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
