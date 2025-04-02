import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:flutter/foundation.dart';

class TagScannerPage extends StatefulWidget {
  const TagScannerPage({super.key});

  @override
  State<TagScannerPage> createState() => _TagScannerPageState();
}

class _TagScannerPageState extends State<TagScannerPage> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;
  bool _isProcessing = false;
  String _tagResult = 'Scan a tag to get started';

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
  _cameras = await availableCameras();

  if (_cameras.isEmpty) {
    setState(() {
      _tagResult = 'No camera found (simulator limitation)';
    });
    return;
  }

  _cameraController = CameraController(
    _cameras[0],
    ResolutionPreset.medium,
    enableAudio: false,
  );

  await _cameraController.initialize();
  await _cameraController.startImageStream(processCameraImage);

  setState(() {
    _isCameraInitialized = true;
  });
}

  void processCameraImage(CameraImage image) async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      final WriteBuffer allBytes = WriteBuffer();
      for (var plane in image.planes) {
        allBytes.putUint8List(plane.bytes);
      }
      final bytes = allBytes.done().buffer.asUint8List();

      final Size imageSize = Size(image.width.toDouble(), image.height.toDouble());

      final InputImageRotation imageRotation = InputImageRotation.rotation0deg;

      final InputImageFormat inputImageFormat = InputImageFormat.nv21;


      final planeData = image.planes.map(
        (plane) {
          return InputImagePlaneMetadata(
            bytesPerRow: plane.bytesPerRow,
            height: plane.height,
            width: plane.width,
          );
        },
      ).toList();

      final inputImageData = InputImageData(
        size: imageSize,
        imageRotation: imageRotation,
        inputImageFormat: inputImageFormat,
        planeData: planeData,
      );

      final inputImage = InputImage.fromBytes(
        bytes: bytes,
        inputImageData: inputImageData,
      );

      final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
      textRecognizer.close();

      if (recognizedText.text.isNotEmpty) {
        setState(() {
          _tagResult = 'Detected Tag:\n${recognizedText.text}';
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error processing image: $e");
      }
    } finally {
      _isProcessing = false;
    }
  }

  @override
  void dispose() {
    _cameraController.stopImageStream();
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clothing Tag Scanner')),
      body: _isCameraInitialized
          ? Column(
              children: [
                Expanded(child: CameraPreview(_cameraController)),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    _tagResult,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
