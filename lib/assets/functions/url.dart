import 'package:go_router/go_router.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../label.dart';

urlLink(link) async {
  String url = link;
  final Uri uri = Uri.parse(url);
  if (kIsWeb) {
    html.window.open(url, '_blank');
  } else if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  }
}

String currentUrl(context, [String destination = ""]) {
  String url =
      '${StringResource.url}${GoRouter.of(context).location}$destination';
  url = Uri.encodeFull(url);
  return url;
}
