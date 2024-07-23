import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';

InputDecoration customNoteDecoration({
  required BuildContext context,
  required String labelText,
  Color errorBorderColor = Colors.redAccent,
}) {
  return InputDecoration(
    labelText: labelText,
    fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
    helperText: '',
    labelStyle: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: FontsTheme.mediumSize,
        color: Theme.of(context).colorScheme.inverseSurface),
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderSize.smallRadius,
      borderSide: BorderSide(color: errorBorderColor, width: 0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderSize.smallRadius,
      borderSide: BorderSide(color: errorBorderColor, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderSize.smallRadius,
      borderSide:
          BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderSize.smallRadius,
      borderSide: BorderSide(color: Colors.transparent, width: 0),
    ),
  );
}
