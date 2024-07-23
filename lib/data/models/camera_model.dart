import 'package:camera/camera.dart';

class CameraState {
  final CameraController? cameraController;
  final bool isInitialized;
  final List<CameraDescription>? cameras;
  final int? selectedCameraIndex;

  CameraState({
    this.cameraController,
    this.isInitialized = false,
    this.cameras,
    this.selectedCameraIndex,
  });

  CameraState copyWith({
    CameraController? cameraController,
    bool? isInitialized,
    List<CameraDescription>? cameras,
    int? selectedCameraIndex,
  }) {
    return CameraState(
      cameraController: cameraController ?? this.cameraController,
      isInitialized: isInitialized ?? this.isInitialized,
      cameras: cameras ?? this.cameras,
      selectedCameraIndex: selectedCameraIndex ?? this.selectedCameraIndex,
    );
  }
}
