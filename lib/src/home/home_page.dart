import 'package:app/common_lib.dart';
import 'package:app/data/providers/location_model.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../data/providers/camera_provider.dart';
import 'components/camera_controller.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.read(locationProvider.notifier).getCurrentLocation();
    ref.read(cameraNotifierProvider.notifier).initializeCamera();
  }

  @override
  Widget build(BuildContext context) {
    final cameraState = ref.watch(cameraNotifierProvider);

    if (!cameraState.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          if (cameraState.cameraController != null)
            Positioned.fill(
              child: CameraPreview(cameraState.cameraController!),
            ),
          const CameraControls(),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              onPressed: () => context.pushNamed(RoutesDocument.profile),
              icon: SvgPicture.asset(Assets.assetsSvgProfile),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              onPressed: () => context.pushNamed(RoutesDocument.categories),
              icon: SvgPicture.asset(Assets.assetsSvgCategory),
            ),
          ),
        ],
      ),
    );
  }
}
