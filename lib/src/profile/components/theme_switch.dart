import 'package:app/theme/theme_mode.dart';
import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import '../../../data/providers/settings_provider.dart';

class ChangeThemeButton extends ConsumerStatefulWidget {
  const ChangeThemeButton({super.key});

  @override
  ConsumerState<ChangeThemeButton> createState() => _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends ConsumerState<ChangeThemeButton> {
  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    bool isDarkMode = settings.themeMode.isDark;
    void switchThemeMode() {
      ref.read(settingsProvider.notifier).toggleThemeMode(context);
    }

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.medium),
        child: ListTile(
            title: const Text('الثيم'),
            trailing: Switch(
                thumbIcon: WidgetStatePropertyAll(isDarkMode
                    ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode)),
                value: isDarkMode,
                onChanged: (f) {
                  switchThemeMode();
                })));
  }
}


/*

import 'package:app/theme/theme_mode.dart';
import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import '../../../data/providers/settings_provider.dart';

class ChangeThemeButton extends ConsumerStatefulWidget {
  const ChangeThemeButton({super.key});

  @override
  ConsumerState<ChangeThemeButton> createState() => _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends ConsumerState<ChangeThemeButton> {
  @override
  Widget build(BuildContext context) {
    final settings = ref.read(settingsProvider);
    bool isDarkMode = settings.themeMode.isDark;
    void _switchThemeMode() {
      ref.read(settingsProvider.notifier).toggleThemeMode(context);
    }

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.medium),
        child: ListTile(
            title: const Text('الثيم'),
            trailing: Switch(
                thumbIcon: WidgetStatePropertyAll(isDarkMode
                    ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode)),
                value: isDarkMode,
                onChanged: (f) {
                  _switchThemeMode();
                })));
  }
}

*/