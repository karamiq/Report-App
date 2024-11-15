import 'package:app/common_lib.dart';
import 'package:app/data/models/ViechleFee.dart';
import 'package:flutter/material.dart';
import '../../utils/components/custom_app_bar.dart';
import 'components/fee_date_and_receipt_number.dart';
import 'components/fee_full_detailes.dart';

class FeeDetailesPage extends StatelessWidget {
  const FeeDetailesPage({
    super.key,
    required this.feeDetailes,
  });
  final VehicleFee feeDetailes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'تفاصيل المخالفة'),
      body: Padding(
        padding: Insets.largeAll,
        child: ColumnPadded(
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: Insets.small,
            children: [
              Text(
                'صورة المخالفة',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontsTheme.mediumWeight,
                    fontSize: FontsTheme.mediumSize),
              ),
              FeeImageView(
                imagePath: feeDetailes.images.isNotEmpty
                    ? feeDetailes.images.first
                    : '',
              ),
              const Gap(Insets.medium),
              FeeReceiptAndDate(
                feeDate: feeDetailes.creationDate,
                receiptNumber: feeDetailes.number,
              ),
              const Gap(Insets.medium),
              FeeFullDetailes(
                plateNumber: feeDetailes.plateNumber.toString(),
                governorate: feeDetailes.governorate,
                plateLetter: feeDetailes.plateCharacter.isEmpty
                    ? 'لا يوجد'
                    : feeDetailes.plateCharacter,
                routeName: feeDetailes.violationLocation,
              ),
            ]),
      ),
    );
  }
}

class FeeImageView extends StatelessWidget {
  const FeeImageView({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        try {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              child: SizedBox(
                width: 400,
                height: 400,
                child: ClipRRect(
                  borderRadius: BorderSize.smallRadius,
                  child: Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return SizedBox(
                          width: 400,
                          height: 400,
                          child: Card(
                            child: Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ??
                                            1)
                                    : null,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                        width: 400,
                        height: 400,
                        child: Card(
                          child: Center(
                            child: Text(
                              'فشل تحميل الصورة',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: FontsTheme.bigSize,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        } catch (e) {}
      },
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: 130,
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imagePath),
                  ),
                  borderRadius: BorderSize.mediumRadius,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              // Add filter here
              Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderSize.mediumRadius,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'فتح الصورة',
                  style: TextStyle(
                      fontSize: FontsTheme.mediumBigSize,
                      color: Theme.of(context).colorScheme.surface),
                ),
                const Gap(Insets.small),
                SvgPicture.asset(
                  Assets.assetsSvgCheckCircle,
                  color: Theme.of(context).colorScheme.surface,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
