import 'dart:convert';

import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'assets/functions/route.dart';
import 'firebase_options.dart';

import 'package:url_strategy/url_strategy.dart';
import 'package:squadron/squadron.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:universal_html/html.dart';

import 'assets/widgets/snackbar.dart';
import 'package:gimmic/assets/label.dart';
import 'package:gimmic/src/homebase.dart';
import 'package:gimmic/src/page/details.dart';
import 'package:gimmic/src/page/resource.dart';
import 'package:gimmic/src/page/unity_viewer.dart';

void initSquadron(String id) {
  Squadron.setId(id);
  Squadron.setLogger(ConsoleSquadronLogger());
  Squadron.logLevel = SquadronLogLevel.off;
  Squadron.debugMode = false;
}

/* default runApp */
/* void main() async {
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

  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  runApp(Gimmic());
}

class Gimmic extends StatelessWidget {
  Gimmic({super.key});

  final _router = GoRouter(
    debugLogDiagnostics: false,
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return SharedAxisPage(
              key: state.pageKey,
              duration: const Duration(milliseconds: 500),
              transitionType: SharedAxisTransitionType.scaled,
              child: const HomeBase()
            );
          },
          routes: <GoRoute>[
            GoRoute(
                path: 'resource',
                name: 'resource',
                pageBuilder: (context, state) {
                  final search = state.queryParams['search'];
                  return FadePage(key: state.pageKey, child: Resource(arguments: search));
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
                        Map valueMap = jsonDecode(arguments);

                        // Revert changes workaround for download dialog hero semi-transparent background
                        return MaterialPage(
                            key: state.pageKey,
                            child: Details(arguments: valueMap));
                      },
                      routes: <GoRoute>[
                        GoRoute(
                            name: 'viewer',
                            path: 'viewer',
                            pageBuilder: (context, state) {
                              return FadePage(key: state.pageKey, child: const UnityViewer());
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
