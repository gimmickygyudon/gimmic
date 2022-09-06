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

import 'package:responsive_framework/responsive_framework.dart';

// default runApp (only for testing 7 developing)
/* void main() {
  usePathUrlStrategy();
  runApp(const Gimmic());
} */

Future<void> main() async {
  await Firebase.initializeApp(
    // linux isn't implemented yet with firebase platform
    // options: DefaultFirebaseOptions.currentPlatform,
    options: DefaultFirebaseOptions.web,
  );
  usePathUrlStrategy();
  runApp(const Gimmic());
}

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
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 16000,
          minWidth: 9000,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScaleDown(848, name: TABLET),
            const ResponsiveBreakpoint.resize(1024, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(1600, name: '4K'),
          ],
        ),
        debugShowCheckedModeBanner: false,
        title: StringResource.title,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeBase(title: StringResource.title),
          '/resource': (context) => Resource(
              arguments: ModalRoute.of(context)?.settings.arguments as Map),
          '/resource/detail': (context) => Details(
              arguments: ModalRoute.of(context)?.settings.arguments as Map),
          '/resource/detail/view': (context) => const UnityViewer(),
        },
        theme: ThemeData(
          visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
          useMaterial3: true,
        ),
      ),
    );
  }
}
