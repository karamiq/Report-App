import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';

class CustomProfileOption extends StatelessWidget {
  const CustomProfileOption(
      {super.key,
      required this.title,
      required this.icon,
      this.color,
      required this.onPressed});

  final String title;
  final String icon;
  final Color? color;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.medium),
      child: Column(
        children: [
          InkWell(
            onTap: onPressed,
            borderRadius: BorderSize.smallRadius,
            child: ListTile(
              leading: SvgPicture.asset(
                icon,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
              title: Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.inverseSurface,
                size: 30,
              ),
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
