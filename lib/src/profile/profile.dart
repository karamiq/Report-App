import 'package:app/common_lib.dart';
import 'package:app/data/models/user_model.dart';
import 'package:app/data/providers/user_provider.dart';
import 'package:app/utils/components/custom_app_bar.dart';
import 'package:app/utils/components/custom_profile_option.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/profile_page_head.dart';
import 'components/theme_switch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(userProvider);

    return Scaffold(
      appBar: CustomAppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: 'الملف الشخصي'),
      body: userState == null
          ? const Center(child: CircularProgressIndicator())
          : ColumnPadded(children: [
              ProfilePageHead(
                name: userState.fullName,
                email: userState.email,
                registrationDate: userState.creationDate.formatDate(),
                profileImageUrl:
                    'https://cdn.oneesports.gg/cdn-data/2023/04/Anime_DemonSlayer_Muzan_3.jpg',
              ),
              CustomProfileOption(
                title: 'الملف الشخصي',
                icon: Assets.assetsSvgProfile,
                onPressed: () {},
              ),
              CustomProfileOption(
                title: 'سجل المخالفات',
                icon: Assets.assetsSvgReceiptMinus,
                onPressed: () =>
                    context.pushNamed(RoutesDocument.recordOfViolations),
              ),
              CustomProfileOption(
                title: 'اللغة',
                icon: Assets.assetsSvgTranslate,
                onPressed: () {},
              ),
              CustomProfileOption(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => const SignOutBottomSheet(),
                ),
                title: 'تسجيل الخروج',
                icon: Assets.assetsSvgSignOut,
                color: Theme.of(context).colorScheme.error,
              ),
              const ChangeThemeButton(),
            ]),
    );
  }
}

class SignOutBottomSheet extends ConsumerWidget {
  const SignOutBottomSheet({
    super.key,
    this.userState,
  });
  final UserModel? userState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 280,
      child: Padding(
        padding: const EdgeInsets.all(Insets.medium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(Insets.medium),
            const Text(
              'هل انت متأكد من ذلك ؟ ',
              style: TextStyle(fontSize: FontsTheme.bigSize),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  ref.read(userProvider.notifier).clearUser();
                  prefs.remove('token');
                  context.go(RoutesDocument.login);
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).colorScheme.dangerColor),
                child: const Text('تسجيل الخروج')),
            TextButton(
                onPressed: () => context.pop(),
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                  foregroundColor: Theme.of(context).colorScheme.onSurface,
                ),
                child: const Text('لا')),
            const Gap(Insets.medium),
          ],
        ),
      ),
    );
  }
}