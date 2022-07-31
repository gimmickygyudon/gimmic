import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:gimmic/assets/label.dart';
import 'package:gimmic/src/homebase.dart';
import 'package:gimmic/src/page/resource.dart';

void main() {
  runApp(const Gimmic());
}

/* Future<void> main() async {
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
    options: DefaultFirebaseOptions.web,
  );
  runApp(const Gimmic());
} */

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
      title: StringResource.logoName,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeBase(title: StringResource.logoName),
        '/resource': (context) => const YourResources(),
      },
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      // home: const HomeBase(title: StringResource.logoName),
    );
  }
}
