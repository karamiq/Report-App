import 'package:flutter/material.dart';

import '../../../common_lib.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
    required this.fetch,
  });

  final VoidCallback fetch;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Theme.of(context).colorScheme.surface,
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () async {
              await context.pushNamed(RoutesDocument.profile);
              fetch();
            },
            icon: SvgPicture.asset(Assets.assetsSvgProfile),
          ),
          IconButton(
            onPressed: () async {
              context.pushNamed(RoutesDocument.categories);
              fetch();
            },
            icon: SvgPicture.asset(Assets.assetsSvgCategory),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
