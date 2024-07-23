import 'package:app/common_lib.dart';
import 'package:app/data/models/ViechleFee.dart';
import 'package:flutter/material.dart';

class FeeIsSendPage extends StatelessWidget {
  const FeeIsSendPage({super.key, required this.feeDetailes});
  final ViechleFee feeDetailes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Insets.largeAll,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Column(
                children: [
                  Image.asset(Assets.assetsImagesFeeSendImage),
                  const Gap(Insets.medium),
                  Text(
                    'تم تسجيل المخالفة بنجاح',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: FontsTheme.veryBigSize,
                        fontWeight: FontsTheme.bigWeight),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: OutlinedButton(
                          onPressed: () => context.pushNamed(
                              RoutesDocument.feeDetailes,
                              extra: feeDetailes),
                          child: const Text(
                            'تفاصيل المخالفة',
                            style: TextStyle(
                              fontWeight: FontsTheme.mediumWeight,
                              fontSize: FontsTheme.mediumSize,
                            ),
                          ))),
                  const Gap(Insets.medium),
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: () => context.pop(),
                          child: const Text(
                            'عودة',
                            style: TextStyle(
                              fontWeight: FontsTheme.mediumWeight,
                              fontSize: FontsTheme.mediumSize,
                            ),
                          )))
                ],
              ),
            ]),
      ),
    );
  }
}
