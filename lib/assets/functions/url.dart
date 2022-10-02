import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../label.dart';
import '../widgets/snackbar.dart';

urlLink(context, link) async {
  String url = link;
  final Uri uri = Uri.parse(url);
  if (kIsWeb) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(snackbarOpenLoading('Opening in New Tab... '));
    html.window.open(url, '_blank');
  } else if (await canLaunchUrl(uri)) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(snackbarOpenLoading('Opening in Web Browser...'));
    launchUrl(uri);
  }
}

String currentUrl(context, [String destination = ""]) {
  String url =
      '${StringResource.url}${GoRouter.of(context).location}$destination';
  url = Uri.encodeFull(url);
  return url;
}
