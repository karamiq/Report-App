import 'package:app/data/providers/camera_provider.dart';
import 'package:app/src/home/components/camera_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:app/common_lib.dart';
import 'package:app/data/providers/location_provider.dart';
import 'package:flutter/services.dart';
import 'components/home_page_app_bar.dart';
import 'components/permission_dialog_and_overlay.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Color? backgroundColor;
  Future<void>? _initializationFuture;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

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
    backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      extendBody: true,
      body: FutureBuilder<void>(
        future: _initializationFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('حدث خطأ: ${snapshot.error}'),
            );
          } else {
            final cam = ref.watch(cameraNotifierProvider);
            if (cam.isInitialized) {
              if (!mounted) setState(() => backgroundColor = Colors.transparent);
              return LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      SizedBox(
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                        child: CameraPreview(
                          cam.cameraController!,
                        ),
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HomePageAppBar(),
                          CameraControls(),
                        ],
                      )
                    ],
                  );
                },
              );
            } else {
              return const PermissionOverlay();
            }
          }
        },
      ),
    );
  }
}
