import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CameraScreen(cameras: cameras),
    );
  }
}

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraScreen({super.key, required this.cameras});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  bool _isRecording = false;
  XFile? _capturedImage;
  XFile? _capturedVideo;
  VideoPlayerController? _videoPlayerController;
  bool _isVideoPlayerInitialized = false;

  @override
  void initState() {
    super.initState();
    if (widget.cameras.isNotEmpty) {
      _initCamera(widget.cameras.first);
    }
  }

  Future<void> _initCamera(CameraDescription cameraDescription) async {
    final controller = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
    );

    _controller = controller;
    _initializeControllerFuture = controller.initialize();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _videoPlayerController?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      return;
    }

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return;
    }

    try {
      await _initializeControllerFuture;
      final image = await controller.takePicture();

      setState(() {
        _capturedImage = image;
        _capturedVideo = null; // Reset video if we took a picture
        _disposeVideoController();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _toggleRecording() async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      return;
    }

    if (_isRecording) {
      final file = await controller.stopVideoRecording();
      setState(() {
        _isRecording = false;
        _capturedVideo = file;
        _capturedImage = null; // Reset image if we recorded a video
      });
      await _initVideoPlayer(file);
    } else {
      await controller.startVideoRecording();
      setState(() {
        _isRecording = true;
      });
    }
  }

  Future<void> _initVideoPlayer(XFile videoFile) async {
    _disposeVideoController();
    _videoPlayerController = VideoPlayerController.file(File(videoFile.path));
    await _videoPlayerController!.initialize();
    setState(() {
      _isVideoPlayerInitialized = true;
    });
    await _videoPlayerController!.setLooping(true);
    await _videoPlayerController!.play();
  }

  void _disposeVideoController() {
    _videoPlayerController?.dispose();
    _videoPlayerController = null;
    _isVideoPlayerInitialized = false;
  }

  void _clearMedia() {
    setState(() {
      _capturedImage = null;
      _capturedVideo = null;
      _disposeVideoController();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cameras.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Camera Demo')),
        body: const Center(child: Text('No cameras found')),
      );
    }

    // If we have captured media, show it
    if (_capturedImage != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Captured Image')),
        body: Column(
          children: [
            Expanded(child: Image.file(File(_capturedImage!.path))),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _clearMedia,
                child: const Text('Take Another'),
              ),
            ),
          ],
        ),
      );
    }

    if (_capturedVideo != null &&
        _videoPlayerController != null &&
        _isVideoPlayerInitialized) {
      return Scaffold(
        appBar: AppBar(title: const Text('Recorded Video')),
        body: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: _videoPlayerController!.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      _videoPlayerController!.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_videoPlayerController!.value.isPlaying) {
                          _videoPlayerController!.pause();
                        } else {
                          _videoPlayerController!.play();
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _clearMedia,
                    child: const Text('Record Another'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Otherwise, show the camera preview
    return Scaffold(
      appBar: AppBar(title: const Text('Camera')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(child: CameraPreview(_controller!));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: 'takepicture',
            onPressed: _takePicture,
            child: const Icon(Icons.camera_alt),
          ),
          FloatingActionButton(
            heroTag: 'recordvideo',
            onPressed: _toggleRecording,
            backgroundColor: _isRecording ? Colors.red : null,
            child: Icon(_isRecording ? Icons.stop : Icons.videocam),
          ),
        ],
      ),
    );
  }
}
