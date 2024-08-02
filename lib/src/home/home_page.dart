import 'package:app/data/providers/camera_provider.dart';
import 'package:app/src/home/components/camera_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:app/common_lib.dart';
import 'package:app/data/providers/location_provider.dart';
import 'components/home_page_app_bar.dart';
import 'components/permission_dialog_and_overlay.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Future<void>? _initializationFuture;

  @override
  void initState() {
    super.initState();
    _initializationFuture = _initialize();
  }

  Future<void> _initialize() async {
    final cameraInitialized =
        await ref.read(cameraNotifierProvider.notifier).initializeCamera();
    final locationGranted =
        await ref.read(locationProvider.notifier).getCurrentLocation();

    if (!cameraInitialized || !locationGranted) {
      showPermissionDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializationFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Text('حدث خطأ: ${snapshot.error}'),
            ),
          );
        } else {
          final cam = ref.watch(cameraNotifierProvider);

          if (cam.isInitialized) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: SizedBox(
                height: double.infinity,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: CameraPreview(
                      cam.cameraController!,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomePageAppBar(),
                          CameraControls(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Scaffold(
              resizeToAvoidBottomInset: false,
              body: PermissionOverlay(),
            );
          }
        }
      },
    );
  }
}
