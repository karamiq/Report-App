import 'package:app/data/models/ViechleFee.dart';
import 'package:app/data/models/commission_analysis_model.dart';
import 'package:flutter/material.dart';
import '../../common_lib.dart';
import 'custom_svg_style.dart';

class ViolationCard extends StatelessWidget {
  const ViolationCard({
    required this.violation,
    super.key,
  });

  final LastViolation violation;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(RoutesDocument.feeDetailes,
            extra: VehicleFee(
                number: violation.number,
                plateNumber: violation.plateNumber.toString(),
                plateTypeId: 'violation.vehiclePlateType',
                plateCharacter: violation.vehiclePlateCharacterName.toString(),
                creationDate: DateTime.parse(violation.creationDate),
                governorate: violation.garageGovernorateName.toString(),
                images: violation.images,
                violationLocation: violation.paymentGarage?.name ?? 'لا يوجد'));
      },
      borderRadius: BorderSize.smallRadius,
      child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: Insets.small + Insets.extraSmall, horizontal: Insets.small),
          decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).hintColor.withAlpha(100),
              ),
              borderRadius: BorderSize.smallRadius),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 7,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomSvgStyle(icon: Assets.assetsSvgReceiptMinus),
                    const Gap(Insets.extraSmall),
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
                            violation.number.toString(),
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
                            violation.feeFines.name.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                    const Gap(Insets.small),
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
                            '${violation.amount} د.ع.',
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
          )),
    );
  }
}
