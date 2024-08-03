import 'package:app/common_lib.dart';
import 'package:app/data/providers/camera_provider.dart';
import 'package:app/data/providers/user_provider.dart';
import 'package:app/data/services/clients/auth_client.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final userState = ref.watch(userProvider.notifier);
    final isLoading = useState<bool>(false);
    useEffect(() {
      ref.read(cameraNotifierProvider.notifier).initializeCamera();
    }, []);

    void signIn() async {
      if (!formKey.currentState!.validate()) {
        return;
      }
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
      } catch (e) {
        // Handle error appropriately, such as showing a snackbar or dialog
      } finally {
        isLoading.value = false;
      }
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  return null;
                },
              ),
              PasswordFormField(
                controller: passwordController,
                label: 'كلمة السر',
                hintText: '',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ادخل الرمز';
                  }
                  return null;
                },
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
