import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:gimmic/src/page/unity_viewer.dart';
import 'package:squadron/squadron.dart';
import 'package:universal_html/html.dart';
import 'assets/widgets/snackbar.dart';
import 'firebase_options.dart';

import 'package:gimmic/assets/label.dart';
import 'package:gimmic/src/homebase.dart';
import 'package:gimmic/src/page/details.dart';
import 'package:gimmic/src/page/resource.dart';

import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

void initSquadron(String id) {
  Squadron.setId(id);
  Squadron.setLogger(ConsoleSquadronLogger());
  Squadron.logLevel = SquadronLogLevel.off;
  Squadron.debugMode = false;
}

/* default runApp (only for testing and developing) */ /* 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  kIsWeb ? initSquadron(StringResource.title) : null;
  runApp(Gimmic());
} */

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  kIsWeb ? initSquadron(StringResource.title) : null;
  window.document.onContextMenu.listen((evt) => evt.preventDefault());

  await Firebase.initializeApp(
    // linux isn't implemented yet with firebase platform
    // options: DefaultFirebaseOptions.currentPlatform,
    options: DefaultFirebaseOptions.web,
  );
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
          builder: (context, state) {
            return const HomeBase();
          },
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
                        var object = state.extra;
                        object ??= {
                          "name": "default",
                          "hero": "default",
                          "index": "0"
                        };

                        var arguments = jsonEncode(object);
                        debugPrint('go_route:$arguments');
                        Map valueMap = jsonDecode(arguments);

                        return MaterialPage(
                            child: Details(arguments: valueMap));
                      },
                      routes: <GoRoute>[
                        GoRoute(
                            name: 'viewer',
                            path: 'viewer',
                            pageBuilder: (context, state) {
                              return const MaterialPage(child: UnityViewer());
                            }),
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
        routerConfig: _router,
        scaffoldMessengerKey: rootScaffoldMessengerKey,
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
