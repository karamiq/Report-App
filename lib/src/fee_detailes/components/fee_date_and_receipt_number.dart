import 'package:flutter/material.dart';

import '../../../common_lib.dart';

class FeeReceiptAndDate extends StatelessWidget {
  const FeeReceiptAndDate({
    super.key,
    required this.receiptNumber,
    required this.feeDate,
  });
  final int receiptNumber;
  final DateTime feeDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      padding: Insets.largeAll,
      decoration: BoxDecoration(
          borderRadius: BorderSize.mediumRadius,
          color: Theme.of(context).colorScheme.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: Insets.smallAll,
                  decoration: const BoxDecoration(
                      borderRadius: BorderSize.smallRadius,
                      color: Colors.white),
                  child: SvgPicture.asset(
                    Assets.assetsSvgReceiptMinus,
                    color: Theme.of(context).colorScheme.primary,
                    height: IconSize.large - 4,
                  ),
                ),
                const Gap(Insets.small),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'رقم الوصل',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontsTheme.mediumWeight,
                      ),
                    ),
                    Text(
                      receiptNumber.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontsTheme.mediumWeight,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Gap(Insets.extraLarge),
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: Insets.smallAll,
                  decoration: const BoxDecoration(
                      borderRadius: BorderSize.smallRadius,
                      color: Colors.white),
                  child: SvgPicture.asset(
                    Assets.assetsSvgCalendar2,
                    color: Theme.of(context).colorScheme.primary,
                    height: IconSize.large - 4,
                  ),
                ),
                const Gap(Insets.small),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'تاريخ المخالفة',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontsTheme.mediumWeight,
                      ),
                    ),
                    Text(
                      feeDate.formatDate(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontsTheme.mediumWeight,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
