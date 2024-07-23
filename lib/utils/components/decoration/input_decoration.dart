import 'package:flutter/material.dart';

import '../../../common_lib.dart';

InputDecoration customInputDecoration({
  required BuildContext context,
  String? prefixIcon,
  bool suffixIcon = true,
  required String labelText,
  Color errorBorderColor = Colors.red,
}) {
  return InputDecoration(
    hintText: '',
    counterText: '',
    helperText: '',
    suffixIcon: !suffixIcon
        ? null
        : Padding(
            padding: Insets.mediumAll,
            child: SvgPicture.asset(
              Assets.assetsSvgCaretDown,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
    prefixIcon: prefixIcon == null
        ? null
        : Padding(
            padding: Insets.mediumAll,
            child: SvgPicture.asset(
              prefixIcon,
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
          ),
    labelText: labelText,
    labelStyle: const TextStyle(overflow: TextOverflow.ellipsis),
    fillColor: Theme.of(context).colorScheme.surface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderSize.smallRadius,
      borderSide: BorderSide(color: errorBorderColor, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderSize.smallRadius,
      borderSide: BorderSide(color: errorBorderColor, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderSize.smallRadius,
      borderSide: BorderSide(
          color: Theme.of(context).colorScheme.inverseSurface, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderSize.smallRadius,
      borderSide: BorderSide(
          color: Theme.of(context).hintColor.withAlpha(50), width: 1),
    ),
  );
}
