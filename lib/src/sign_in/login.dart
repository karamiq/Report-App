import 'dart:async';

import 'package:app/common_lib.dart';
import 'package:app/data/models/user_model.dart';
import 'package:app/data/providers/user_provider.dart';
import 'package:app/data/services/clients/auth_client.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final userState = ref.watch(userProvider.notifier);
    final isLoading = useState<bool>(false);

    void signIn() async {
      isLoading.value = true;
      final data = {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
      };
      try {
        final response = await ref.read(authClientProvider).login(data);
        final result = response;
        await userState.setUser(result);
        final pref = await SharedPreferences.getInstance();
        pref.setString('token', result.token);
        if (await userState.isLogin()) {
          context.go(RoutesDocument.cam);
        }
        isLoading.value = false;
      } catch (e) {
        isLoading.value = false;
      }
      isLoading.value = false;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Insets.medium,
          vertical: Insets.large,
        ),
        child: Form(
          key: formKey,
          child: ColumnPadded(
            gap: Insets.medium,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                'تسجيل الدخول',
                style: TextStyle(
                  fontSize: FontsTheme.veryBigSize,
                  fontWeight: FontsTheme.bigWeight,
                ),
              ),
              const Gap(Insets.medium),
              CustomTextFormField(
                controller: emailController,
                hintText: 'الحساب',
              ),
              CustomTextFormField(
                hintText: 'كلمة السر',
                controller: passwordController,
              ),
              const Gap(Insets.large),
              ElevatedButton(
                  onPressed: isLoading.value ? null : signIn,
                  child: isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text('تسجيل الدخول')),
            ],
          ),
        ),
      ),
    );
  }
}
