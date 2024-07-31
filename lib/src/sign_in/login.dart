import 'dart:async';

import 'package:app/common_lib.dart';
import 'package:app/data/models/user_model.dart';
import 'package:app/data/providers/user_provider.dart';
import 'package:app/data/services/clients/_clients.dart';
import 'package:app/data/services/clients/auth_client.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey formKey = GlobalKey<FormState>();
    final emailController = TextEditingController(text: 'admin@garages.com');
    final passwordController = TextEditingController(text: '123@root');
    final userState = ref.watch(userProvider.notifier);

    Future<UserModel?> signIn() async {
      final data = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      try {
        final response = await ref.read(authClientProvider).login(data);
        final result = response;
        userState.setUser(result);
        final pref = await SharedPreferences.getInstance();
        pref.setString('token', result.token);
        if (await userState.isLogin()) {
          context.go(RoutesDocument.cam);
        }

        return result;
      } on DioException catch (e) {
        print(e);
      }
      return null;
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
                  onPressed: signIn, child: const Text('تسجيل الدخول')),
            ],
          ),
        ),
      ),
    );
  }
}
