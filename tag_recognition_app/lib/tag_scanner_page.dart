import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class TagScannerPage extends StatefulWidget {
  const TagScannerPage({super.key});

  @override
  State<TagScannerPage> createState() => _TagScannerPageState();
}

class _TagScannerPageState extends State<TagScannerPage> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isProcessing = false;
  bool _isCameraInitialized = false;
  String _tagResult = 'Scan a tag to get started';

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.medium);
    await _cameraController.initialize();
    setState(() {
      _isCameraInitialized = true; // ✅ Set flag when ready
    });
  }

  Future<void> scanImage() async {
    if (_isProcessing) return;
    setState(() => _isProcessing = true);

    final imageFile = await _cameraController.takePicture();
    final inputImage = InputImage.fromFilePath(imageFile.path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
    textRecognizer.close();

    setState(() {
      _tagResult = recognizedText.text.isEmpty
          ? 'No text found. Try again.'
          : 'Detected Tag:\n${recognizedText.text}';
      _isProcessing = false;
    });
  }

  @override
  void dispose() {
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
                ElevatedButton.icon(
                  onPressed: scanImage,
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Scan Tag'),
                ),
                const SizedBox(height: 20),
              ],
            )
          : const Center(child: CircularProgressIndicator()), 
    );
  }
}
