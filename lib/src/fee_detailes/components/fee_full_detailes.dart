import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import 'fee_detailes_info_sequare.dart';

class FeeFullDetailes extends StatelessWidget {
  final String plateNumber;
  final String governorate;
  final String plateLetter;
  final String routeName;

  const FeeFullDetailes({
    Key? key,
    required this.plateNumber,
    required this.governorate,
    required this.plateLetter,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.large),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: FeeDetailesInfoSequare(
                  title: 'رقم اللوحة',
                  iconPath: Assets.assetsSvgListNumbers,
                  data: plateNumber,
                ),
              ),
              const SizedBox(width: Insets.extraLarge),
              Expanded(
                child: FeeDetailesInfoSequare(
                  title: 'المحافظة',
                  iconPath: Assets.assetsSvgMapTrifold,
                  data: governorate,
                ),
              ),
            ],
          ),
          const SizedBox(height: Insets.large),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: FeeDetailesInfoSequare(
                  title: 'حرف اللوحة',
                  iconPath: Assets.assetsSvgListNumbers,
                  data: plateLetter,
                ),
              ),
              const SizedBox(width: Insets.extraLarge),
              Expanded(
                child: FeeDetailesInfoSequare(
                  title: 'اسم الخط',
                  iconPath: Assets.assetsSvgListNumbers,
                  data: routeName,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
