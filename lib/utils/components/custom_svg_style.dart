import 'package:flutter/material.dart';

import '../../common_lib.dart';

class CustomSvgStyle extends StatelessWidget {
  const CustomSvgStyle({
    super.key,
    required this.icon,
    this.color,
  });

  final dynamic icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Insets.small),
      decoration: BoxDecoration(
        borderRadius: BorderSize.midSmallRadius,
        color: color != null
            ? color!.withOpacity(0.2)
            : Theme.of(context).colorScheme.primaryContainer,
      ),
      child: icon is String
          ? SvgPicture.asset(
              icon,
              color: color ?? Theme.of(context).colorScheme.primary,
            )
          : Icon(
              icon,
              color: color ?? Theme.of(context).colorScheme.primary,
            ),
    );
  }
}
