import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gimmic/src/page/unity_viewer.dart';
import 'firebase_options.dart';

import 'package:gimmic/assets/label.dart';
import 'package:gimmic/src/homebase.dart';
import 'package:gimmic/src/page/details.dart';
import 'package:gimmic/src/page/resource.dart';

import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

// default runApp (only for testing 7 developing)
/* void main() {
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(Gimmic());
} */

Future<void> main() async {
  await Firebase.initializeApp(
    // linux isn't implemented yet with firebase platform
    // options: DefaultFirebaseOptions.currentPlatform,
    options: DefaultFirebaseOptions.web,
  );
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(Gimmic());
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
  Gimmic({super.key});

  final _router = GoRouter(
    debugLogDiagnostics: false,
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const HomeBase(),
          routes: <GoRoute>[
            GoRoute(
                path: 'resource',
                builder: (context, state) {
                  final search = state.queryParams['search'];
                  return Resource(arguments: search);
                },
                routes: <GoRoute>[
                  GoRoute(
                      name: 'details',
                      path: ':name',
                      pageBuilder: (context, state) {
                        final name = state.params['name'];
                        var object = state.extra;
                        object ??= {
                          "name": "default",
                          "hero": "default",
                          "index": "0"
                        };

                        var arguments = jsonEncode(object);
                        debugPrint(arguments);
                        Map valueMap = jsonDecode(arguments);

                        return MaterialPage(
                            child: Details(arguments: valueMap));
                      },
                      routes: <GoRoute>[
                        GoRoute(
                            name: 'viewer',
                            path: 'viewer',
                            pageBuilder: (context, state) =>
                                const MaterialPage(child: UnityViewer())),
                      ])
                ]),
          ]),
    ],
    // errorBuilder: (context, state) => ErrorScreen(state.error),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp.router(
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
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
        theme: ThemeData(
          visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
          useMaterial3: true,
        ),
      ),
    );
  }
}
