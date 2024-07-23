import 'package:flutter/material.dart';

import '../../common_lib.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor,
  });
  final String title;
  final Color? backgroundColor;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    Theme.of(context).scaffoldBackgroundColor;

    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontsTheme.bigWeight,
          fontSize: FontsTheme.mediumBigSize,
          color: backgroundColor == null
              ? Theme.of(context).colorScheme.secondary
              : Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.medium),
          child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.chevron_right_outlined,
                size: IconSize.large,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              )),
        )
      ],
    );
  }
}
