import 'package:flutter/material.dart';

import '../../../common_lib.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Insets.large * 2, vertical: Insets.large),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                context.pushNamed(RoutesDocument.profile);
              },
              icon: SvgPicture.asset(Assets.assetsSvgProfile),
            ),
            IconButton(
              onPressed: () {
                context.pushNamed(RoutesDocument.categories);
              },
              icon: SvgPicture.asset(Assets.assetsSvgCategory),
            ),
          ],
        ),
      ),
    );
  }
}
