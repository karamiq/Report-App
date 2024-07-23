import 'package:flutter/material.dart';
import '../../common_lib.dart';
import 'custom_svg_style.dart';

class ViolationCard extends StatelessWidget {
  const ViolationCard(
      {super.key,
      required this.recieptNumber,
      required this.violationType,
      required this.price,
      this.id = ''});

  final String id;
  final String recieptNumber;
  final String violationType;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
            vertical: Insets.small + Insets.extraSmall,
            horizontal: Insets.small),
        decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).hintColor.withAlpha(100),
            ),
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: BorderSize.smallRadius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSvgStyle(icon: Assets.assetsSvgReceiptMinus),
                  const Gap(Insets.small),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'رقم الوصل',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: FontsTheme.smallSize,
                          ),
                        ),
                        Text(
                          recieptNumber,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 14,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'نوع المخالفة',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: FontsTheme.smallSize,
                          ),
                        ),
                        Text(
                          violationType,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'المبلغ',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: FontsTheme.smallSize,
                          ),
                        ),
                        Text(
                          '$price د.ع.',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
