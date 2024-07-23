import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import '../../../utils/components/custom_svg_style.dart';

class FeeDetailesInfoSequare extends StatelessWidget {
  final String title;
  final String iconPath;
  final String data;

  const FeeDetailesInfoSequare({
    super.key,
    required this.iconPath,
    required this.data,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomSvgStyle(icon: iconPath),
        const Gap(Insets.small),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontsTheme.mediumWeight,
                  color: Theme.of(context).hintColor,
                ),
              ),
              Text(
                data,
                softWrap: true,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: FontsTheme.mediumSize,
                  fontWeight: FontsTheme.mediumBigWeight,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
