import 'package:flutter/material.dart';

import '../../../common_lib.dart';

class ChartInfo extends StatelessWidget {
  const ChartInfo({
    super.key,
    required this.title,
    required this.data,
    required this.color,
  });
  final String title;
  final int data;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const Gap(Insets.extraSmall),
        Expanded(
          child: Text(
            '$title $data',
            maxLines: 3,
            style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: FontsTheme.mediumSize,
                fontWeight: FontsTheme.mediumWeight,
                color: Colors.white),
          ),
        ),
      ],
    );
  }
}
