import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:gimmic/assets/label.dart';
import 'package:gimmic/src/homebase.dart';

import 'package:gimmic/src/page/details.dart';
import 'package:gimmic/src/page/resource.dart';
import 'package:gimmic/src/page/unity_viewer.dart';
import 'package:gimmic/src/plugins/url_strategy.dart';

// default runApp (only for testing)
void main() {
  usePathUrlStrategy();
  runApp(const Gimmic());
}
/* 
Future<void> main() async {
  await Firebase.initializeApp(
    // linux isn't implemented yet with firebase platform
    // options: DefaultFirebaseOptions.currentPlatform,
    options: DefaultFirebaseOptions.web,
  );
  usePathUrlStrategy();
  runApp(const Gimmic()) */

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class Gimmic extends StatelessWidget {
  const Gimmic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringResource.logoName,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeBase(title: StringResource.logoName),
        '/resource': (context) => const Resource(),
        '/resource/detail': (context) => const Details(),
        '/resource/detail/view': (context) => const UnityViewer(),
      },
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
    );
  }
}
