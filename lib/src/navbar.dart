import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:gimmic/assets/label.dart';
import 'package:url_launcher/url_launcher.dart';
<<<<<<< HEAD
import 'package:url_launcher/url_launcher_string.dart';
=======
import 'package:universal_html/html.dart' as html;
>>>>>>> dev
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navbar {
  static isMobile() {
    return AppBar(
      backgroundColor: Colors.grey.shade100,
      elevation: 0.0,
      toolbarHeight: 80,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Row(
          children: const <Widget>[
            Text(
              StringResource.logoName,
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              width: 24,
            ),
          ],
        ),
      ),
    );
  }

  static isDesktop() {
    return AppBar(
      backgroundColor: Colors.grey.shade200,
      surfaceTintColor: Colors.grey.shade200,
      elevation: 0.0,
      toolbarHeight: 100,
      title: Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Row(children: const <Widget>[
          Text(
            StringResource.logoName,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
          ),
        ]),
      ),
      /* title: const Text(
        StringResource.logoName,
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
      ), */
      actions: [
        Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Row(
              children: [
                TextButton(
                  child: const Text(StringResource.resourceMenu),
                  onPressed: () {
                    Navigator.pushNamed(context, '/resource');
                  },
                ),
                const SizedBox(
                  width: 12,
                ),
                ElevatedButton.icon(
                  style: const ButtonStyle(alignment: Alignment.center)
                      .copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                  onPressed: () async {
<<<<<<< HEAD
                    final Uri url =
                        Uri.parse('https://github.com/gimmickygyudon/gimmic/');
                    if (await canLaunchUrl(url)) launchUrl(url);
=======
                    String url = 'https://github.com/gimmickygyudon/gimmic/';
                    final Uri uri = Uri.parse(url);
                    if (kIsWeb) {
                      html.window.open(url, '_blank');
                    } else if (await canLaunchUrl(uri)) {
                      launchUrl(uri);
                    }
>>>>>>> dev
                  },
                  icon: const Icon(
                    FontAwesomeIcons.github,
                    size: 18.0,
                  ),
                  label: const Text('Github'),
                )
              ],
            ),
          );
        })
      ],
    );
  }
}
