import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:restart_app/restart_app.dart';

class PermissionOverlay extends StatelessWidget {
  const PermissionOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Positioned.fill(
        child: Material(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'إذن مطلوب',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'تصريح الكاميرا و الموقع مطلوب لاستخدام هذه الميزة. يرجى منح الإذن في الاعدادات ثم اعادة تشغيل التطبيق.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => openAppSettings(),
                        child: const Text('فتح الإعدادات'),
                      ),
                      const SizedBox(width: 20),
                      TextButton(
                        onPressed: () => Restart.restartApp(),
                        child: const Text('اعادة التشغيل'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showPermissionDialog(context) {
  showDialog(
    context: Navigator.of(context).context,
    builder: (context) => AlertDialog(
      title: const Text('مطلوب إذن'),
      content: const Text(
        'تصريح الكاميرا و الموقع مطلوب لاستخدام هذه الميزة. يرجى منح الإذن في الاعدادات ثم اعد تشغيل التطبيق.',
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () {
            openAppSettings();
          },
          child: const Text('فتح الإعدادات'),
        ),
        TextButton(
          onPressed: () => Restart.restartApp(),
          child: const Text('اعادة التشغيل'),
        ),
      ],
    ),
  );
}
