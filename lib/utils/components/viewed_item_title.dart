import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';

class ViewedItemsTitle extends StatelessWidget {
  const ViewedItemsTitle({
    super.key,
    required this.mainText,
    this.secontText = '',
    this.onTap,
    this.secondTextPressable = true,
    this.padding = Insets.smallAll,
  });
  final String mainText;
  final dynamic secontText;
  final dynamic onTap;
  final bool secondTextPressable;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            mainText,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontsTheme.bigWeight,
              fontSize: FontsTheme.mediumBigSize,
            ),
          ),
          secontText.isEmpty
              ? Text(
                  secontText,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontsTheme.normalWeight,
                    fontSize: FontsTheme.mediumSize,
                  ),
                )
              : InkWell(
                  onTap: secondTextPressable == true ? onTap : null,
                  borderRadius: BorderSize.smallRadius,
                  child: Padding(
                    padding: Insets.extraSmallAll,
                    child: Text(
                      secontText,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontsTheme.mediumBigWeight,
                        fontSize: FontsTheme.mediumSize,
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
