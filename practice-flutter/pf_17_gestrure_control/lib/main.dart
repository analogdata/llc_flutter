import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: GestureDemo());
  }
}

class GestureDemo extends StatefulWidget {
  const GestureDemo({super.key});

  @override
  State<GestureDemo> createState() => _GestureDemoState();
}

class _GestureDemoState extends State<GestureDemo> {
  String _message = 'Tap the box';
  Offset _position = Offset.zero;
  double _scale = 1.0;
  Offset _basePosition = Offset.zero;
  double _baseScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GestureDetector Demo')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _message = 'Single tap';
                });
              },
              onDoubleTap: () {
                setState(() {
                  _message = 'Double tap';
                });
              },
              onLongPress: () {
                setState(() {
                  _message = 'Long press';
                });
              },
              onScaleStart: (details) {
                _basePosition = _position;
                _baseScale = _scale;
              },
              onScaleUpdate: (details) {
                setState(() {
                  _scale = (_baseScale * details.scale).clamp(0.5, 3.0);
                  _position = _basePosition + details.focalPointDelta;
                  _message = details.scale == 1.0 ? 'Dragging' : 'Scaling';
                });
              },
              child: Transform.translate(
                offset: _position,
                child: Transform.scale(
                  scale: _scale,
                  child: Container(
                    width: 150,
                    height: 150,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: const Text(
                      'Touch me',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(_message, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
