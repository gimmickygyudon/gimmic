/* import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ViewResource extends StatelessWidget {
  const ViewResource({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Model Viewer")),
        body: ModelViewer(
          backgroundColor: const Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
          src: 'assets/mustang.gltf',
          alt: "A 3D model of an astronaut",
          ar: true,
          arModes: const ['scene-viewer', 'webxr', 'quick-look'],
          autoRotate: true,
          cameraControls: true,
          iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
          withCredentials: true,
        ),
      ),
    );
  }
}
 */