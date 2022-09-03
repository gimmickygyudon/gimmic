import 'package:universal_html/html.dart' as html;
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

urlLink(link) async {
  String url = link;
  final Uri uri = Uri.parse(url);
  if (kIsWeb) {
    html.window.open(url, '_blank');
  } else if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  }
}
