import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:gimmic/assets/colors.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LayoutDesktop extends StatelessWidget {
  LayoutDesktop({super.key});
  final String timenow = DateFormat("EEEE, MMMM dd").format(DateTime.now());
  final String timecard = DateFormat("MMMM dd").format(DateTime.now());
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Colors.white, Colors.lightBlue],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        surfaceTintColor: Colors.grey.shade200,
        elevation: 0.0,
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Builder(builder: (context) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gimmicky Gyudon',
                    style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w300),
                  ),
                ]);
          }),
        ),
        /* title: const Text(
        StringResource.logoName,
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
      ), */
        actions: [
          Builder(builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(right: 40.0, top: 5.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      TextButton.icon(
                        icon: const Icon(Icons.light_mode_rounded, size: 20.0),
                        onPressed: null,
                        label: const Text('Light Mode'),
                      ),
                      const IconButton(
                        icon: Icon(Icons.settings_outlined),
                        onPressed: null,
                      ),
                    ],
                  ),
                ],
              ),
            );
          })
        ],
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 0.0, left: 48.0, right: 48.0, bottom: 0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 0.0, left: 12.0, right: 12.0, bottom: 0.0),
                        child: Text(
                          'Hi',
                          style: TextStyle(
                            color: ColorsResources.primarytextcolor,
                            fontSize: 48,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0.0, left: 12.0, right: 12.0, bottom: 32.0),
                        child: Text(
                          timenow,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: Container(
                          height: 48.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: Colors.red.shade100,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                  style: ButtonStyle(
                                          alignment: Alignment.center,
                                          backgroundColor:
                                              MaterialStateProperty.resolveWith(
                                                  ((states) {
                                            return states.contains(
                                                    MaterialState.hovered)
                                                ? Colors.white38
                                                : Colors.white70;
                                          })))
                                      .copyWith(
                                          elevation:
                                              ButtonStyleButton.allOrNull(0.0)),
                                  onPressed: () async {
                                    String url =
                                        'https://github.com/gimmickygyudon/gimmic/';
                                    final Uri uri = Uri.parse(url);
                                    if (kIsWeb) {
                                      html.window.open(url, '_blank');
                                    } else if (await canLaunchUrl(uri)) {
                                      launchUrl(uri);
                                    }
                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.github,
                                    size: 18.0,
                                    color: Colors.black54,
                                  ),
                                  label: const Text(
                                      'Clone this Project at Github',
                                      style: TextStyle(color: Colors.black54)),
                                ),
                                Material(
                                  type: MaterialType.circle,
                                  color: Colors.white70,
                                  child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () async {
                                        String url =
                                            'https://github.com/gimmickygyudon/gimmic/';
                                        final Uri uri = Uri.parse(url);
                                        if (kIsWeb) {
                                          html.window.open(url, '_blank');
                                        } else if (await canLaunchUrl(uri)) {
                                          launchUrl(uri);
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.black54,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LayoutBuilder(builder: (BuildContext context,
                            BoxConstraints rowConstraints) {
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.white54,
                                hoverColor: Colors.white12,
                                highlightColor: Colors.white30,
                                onTap: () {
                                  Navigator.pushNamed(context, '/resource');
                                },
                                child: Card(
                                  margin: const EdgeInsets.all(0.0),
                                  elevation: 0,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceVariant,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: rowConstraints.maxWidth,
                                      maxHeight: 325.0,
                                    ),
                                    child: Stack(children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "images/hellocat1.jpg"),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            bottom: 20.0,
                                            left: 20.0,
                                            right: 20.0,
                                            top: 20.0),
                                        alignment: Alignment.bottomCenter,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: <Color>[
                                              Colors.black.withAlpha(0),
                                              Colors.black12,
                                              Colors.black87
                                            ],
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ButtonBar(
                                              buttonPadding: EdgeInsets.zero,
                                              children: [
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .resolveWith(
                                                      (states) {
                                                        return states.contains(
                                                                MaterialState
                                                                    .hovered)
                                                            ? Colors.white
                                                            : Colors.black54;
                                                      },
                                                    ),
                                                    foregroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors.orange
                                                                .shade300),
                                                    /* minimumSize: MaterialStateProperty.all(
                                                            const Size(220, 50)), */
                                                    elevation:
                                                        const MaterialStatePropertyAll(
                                                            0),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context, '/resource');
                                                  },
                                                  child:
                                                      const Text("Get Started"),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Hello Cat',
                                                          style: TextStyle(
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            foreground: Paint()
                                                              ..shader =
                                                                  linearGradient,
                                                            letterSpacing: -0.5,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 14.0,
                                                                  top: 8.0),
                                                          child: Text(
                                                            timecard,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade300,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          IconButton(
                                                              onPressed: () {},
                                                              icon: Icon(
                                                                size: 24.0,
                                                                Icons
                                                                    .picture_in_picture_alt_rounded,
                                                                color: Colors
                                                                    .grey
                                                                    .shade200,
                                                              )),
                                                          IconButton(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              onPressed: () {},
                                                              icon: Icon(
                                                                size: 24.0,
                                                                Icons
                                                                    .more_vert_rounded,
                                                                color: Colors
                                                                    .grey
                                                                    .shade300,
                                                              ))
                                                        ]),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 8.0,
                                                ),
                                                const Text(
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  "Welcome, You made it here! let's enjoy our time together",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TextField(
                    onChanged: (value) => {},
                    decoration: InputDecoration(
                      isDense: false,
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.search),
                      prefixIconConstraints:
                          const BoxConstraints(minWidth: 55.0),
                      /* suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          /* Clear the search field */
                        },
                      ), */
                      suffixIconConstraints:
                          const BoxConstraints(minWidth: 55.0),
                      hintText: 'Search...',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 0.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
