import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gimmic/assets/functions/colors.dart';
import 'package:gimmic/assets/functions/platform.dart';
import 'package:gimmic/assets/functions/url.dart';
import 'package:gimmic/assets/widgets/dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import 'menu.dart';

Widget iconImageDialog(context, images, hero, color, command) {
  return Row(
    children: [
      Tooltip(
        message: 'Quick View',
        child: IconButton(
            visualDensity: isWebMobile
                ? const VisualDensity(horizontal: -2, vertical: -2)
                : null,
            padding: EdgeInsets.zero,
            onPressed: () {
              imageDialogHero(context, images, hero, null);
            },
            color: color,
            icon: const Icon(
              size: 20,
              Icons.image_outlined,
              color: Colors.white,
              shadows: [
                Shadow(
                    color: Colors.black26, offset: Offset(1, 1), blurRadius: 2),
              ],
            )),
      ),
      buttonMoreMenu(currentUrl(context, 'resource'), images, hero, command)
    ],
  );
}

Widget buttonGithub(context) {
  return ElevatedButton.icon(
    style: ButtonStyle(
        visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
        alignment: Alignment.center,
        backgroundColor: MaterialStateProperty.resolveWith(((states) {
          return states.contains(MaterialState.hovered)
              ? Colors.grey.shade800
              : Colors.grey.shade700;
        }))).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
    onPressed: () =>
        urlLink(context, 'https://github.com/gimmickygyudon/gimmic/'),
    icon: const Icon(
      FontAwesomeIcons.github,
      size: 18,
      color: Colors.white,
    ),
    label: Text('Github',
        style: GoogleFonts.roboto(
            fontWeight: isWebMobile ? FontWeight.w500 : FontWeight.w400,
            color: Colors.white)),
  );
}

Widget buttonNotification(context) {
  return ElevatedButton.icon(
      style: const ButtonStyle(
              visualDensity: VisualDensity(horizontal: -2, vertical: -2),
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              alignment: Alignment.center)
          .copyWith(elevation: ButtonStyleButton.allOrNull(0)),
      icon: const Icon(Icons.notifications_none_outlined),
      onPressed: () {
        final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: const Text('Yay! An Empty Notification!'),
          width: 350,
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      label: Text('0', style: GoogleFonts.roboto(fontWeight: FontWeight.w500)));
}

Widget buttonView3DIcon(context, String name, List palettecolor, int colorindex) {
  return Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.black54, borderRadius: BorderRadius.circular(12)),
    child: IconButton(
      visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
      tooltip: '3D View',
      hoverColor: Colors.transparent,
      onPressed: () => GoRouter.of(context).pushNamed('viewer', 
        params: { 'name': name.toLowerCase(), }),
      icon: const Icon(Icons.view_in_ar_rounded, color: Colors.white)
    ),
  );
}

Widget buttonFullscreen(context, images, arguments, List palettecolor, int position) {
  return Tooltip(
    textStyle: const TextStyle(fontSize: 14, color: Colors.white),
    message: 'Fullscreen (f)',
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.grey.shade800,
      borderRadius: BorderRadius.circular(25.7)
    ),
    verticalOffset: 20,
    preferBelow: false,
    child: IconButton( 
      onPressed: () async{
        print('position: $position');
        await imageDialogHero(context, images[position], arguments, position);
      }, 
      style: ButtonStyle(
          visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(8)),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            return states.contains(MaterialState.hovered)
                ? colorLight(palettecolor[position].color, .65)
                : palettecolor.isEmpty
                    ? Colors.blue.shade100
                    : Colors.white;
          }),
      ),
      icon: const Icon(
        size: 22, Icons.fullscreen_rounded,
        shadows: [
          Shadow(
            color: Colors.black45,
            offset: Offset(1, 1),
            blurRadius: 2
          ),
        ],
      ) 
    ),
  ); 
}

Widget buttonView3D(context, String name, List palettecolor, int colorindex) {
  return Tooltip(
    textStyle: const TextStyle(fontSize: 14, color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.grey.shade800,
      borderRadius: BorderRadius.circular(25.7)
    ),
    verticalOffset: 20,
    preferBelow: false,
    message: "See it freely in 360° perspective (b)",
    child: TextButton.icon(
      style: ButtonStyle(
        side: const MaterialStatePropertyAll(BorderSide.none),
        visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
        shadowColor: const MaterialStatePropertyAll(Colors.black54),
        // backgroundColor: const MaterialStatePropertyAll(Colors.black45),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.hovered)
              ? colorLight(palettecolor[colorindex].color, .55)
              : palettecolor.isEmpty
                  ? Colors.blue.shade100
                  : Colors.white;
        }),
        /* overlayColor: MaterialStateProperty.resolveWith(
          (states) {
            return states.contains(MaterialState.hovered)
                ? palettecolor.isNotEmpty
                    ? colorLight(palettecolor[colorindex].color, .025)
                    : null
                : palettecolor.isNotEmpty
                    ? colorLightButton(palettecolor[colorindex].color, .05)
                    : null;
          },
        ), */
        padding: const MaterialStatePropertyAll(EdgeInsets.all(8))
      ),
      onPressed: () => GoRouter.of(context).pushNamed('viewer', 
        params: { 'name': name.toLowerCase(), }),
      icon: const Icon(
        size: 20, Icons.view_in_ar_rounded,
        shadows: [
          Shadow(
            color: Colors.black45,
            offset: Offset(1, 1),
            blurRadius: 2
          ),
        ],
      ),
      label: Text('3D',
        style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          shadows: const [
            Shadow(
              color: Colors.black45,
              offset: Offset(1, 1),
              blurRadius: 2
            ),
          ],
        ),
      )
    ),
  );
}

Widget buttonMoreMenu(String url, String image, String hero, command) {
  return PopupMenuButton<int>(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
        shadows: [
          Shadow(color: Colors.black26, offset: Offset(1, 1), blurRadius: 2),
        ],
      ),
      iconSize: 20,
      itemBuilder: (context) {
        return openPopMenu(context, url, command) +
            openImagePopMenu(context, image, hero) +
            openDividerMenu +
            openItemMenu(context, url);
      });
}

class ButtonLinks extends StatelessWidget {
  ButtonLinks({super.key, required this.bgcolor, required this.fgcolor});

  final Color bgcolor;
  final Color fgcolor;
  final List<String> links = [
    "https://www.instagram.com/gimmickygyudon/",
    "https://twitter.com/GimmickyGyudon",
    "https://github.com/gimmickygyudon/gimmic/",
    "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
  ];
  final List<String> linksName = ["Instagram", "Twitter", "Github", "YouTube"];
  final List linksIcon = [
    FontAwesomeIcons.instagram,
    FontAwesomeIcons.twitter,
    FontAwesomeIcons.github,
    FontAwesomeIcons.youtube
  ];

  final List<Color> linksColor = [
    Colors.grey.shade800,
    Colors.blue,
    Colors.grey.shade800,
    Colors.red
  ];

  @override
  Widget build(BuildContext context) {
    return IconButton(
        visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
        style: ButtonStyle(
            padding: const MaterialStatePropertyAll(EdgeInsets.all(6)),
            shape: const MaterialStatePropertyAll(CircleBorder()),
            backgroundColor: MaterialStatePropertyAll(bgcolor)),
            color: fgcolor,
        tooltip: 'Open Links',
        icon: const Icon(
          Icons.link,
        ),
        padding: EdgeInsets.zero,
        onPressed: () {
          showModalBottomSheet(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width > 900
                    ? MediaQuery.of(context).size.width / 2
                    : MediaQuery.of(context).size.width > 600
                        ? MediaQuery.of(context).size.width / 1.2
                        : MediaQuery.of(context).size.width,
              ),
              elevation: 0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28))),
              context: context,
              builder: (context) {
                return Wrap(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Center(
                          child: Container(
                            height: 4,
                            width: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.grey.shade400),
                          ),
                        )),
                    Center(
                        child: Text('Open Link',
                            style: GoogleFonts.roboto(
                              color: Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ))),
                    const SizedBox(height: 32),
                    Flex(
                        direction: Axis.vertical,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: links.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Tooltip(
                                      message: linksName[index] == "YouTube"
                                          ? 'https://www.youtube.com/channel/UCuAXFkgsw1L7xaCfnd5JJOw'
                                          : links[index],
                                      child: IconButton(
                                          padding: const EdgeInsets.only(
                                              top: 14,
                                              bottom: 14,
                                              left: 6,
                                              right: 6),
                                          style: ButtonStyle(
                                              shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)))),
                                          icon: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Icon(
                                                linksIcon[index],
                                                color: linksColor[index],
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                linksName[index],
                                                style: GoogleFonts.roboto(
                                                  color: Colors.grey.shade800,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                          onPressed: () =>
                                              urlLink(context, links[index])),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                          const SizedBox(height: 100)
                        ])
                  ],
                );
              });
        });
  }
}

Widget downloadButton(context, selectedIndex, index, size) {
  return Tooltip(
    message: "Download",
    child: ElevatedButton.icon(
      onPressed: () {},
      label: Text(size,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w700,
          )),
      icon: const Icon(
        Icons.file_download_outlined,
        size: 22,
      ),
      style: ButtonStyle(
        visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
        padding: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.pressed)) {
            return null;
          }
          return selectedIndex == index
              ? const EdgeInsets.only(right: 5)
              : EdgeInsets.zero;
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.pressed)) {
            return Colors.green;
          }
          return Colors.transparent;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered) ||
              states.contains(MaterialState.pressed)) {
            return Colors.white;
          }
          return Colors.green;
        }),
        elevation: const MaterialStatePropertyAll(0),
        overlayColor: MaterialStateProperty.resolveWith(
          (states) {
            return states.contains(MaterialState.pressed)
                ? Colors.green.shade700
                : Colors.green.shade500;
          },
        ),
      ),
    ),
  );
}

Widget downloadButtonIcon(context) {
  return Visibility(
    visible: context ? true : false,
    child: IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.file_download_outlined,
        size: 22,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.green.shade100),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.hovered)
              ? Colors.white
              : Colors.green;
        }),
        elevation: const MaterialStatePropertyAll(0),
        overlayColor: MaterialStateProperty.resolveWith(
          (states) {
            return states.contains(MaterialState.pressed)
                ? Colors.green.shade700
                : Colors.green.shade500;
          },
        ),
      ),
    ),
  );
}

Widget buttonResourceItem() {
  return Row(
    children: [
      IconButton(
          padding: isWebMobile ? EdgeInsets.zero : null,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          onPressed: () {},
          icon: const Icon(Icons.more_horiz, size: 18, color: Colors.white)),
      IconButton(
          padding: isWebMobile ? EdgeInsets.zero : null,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          onPressed: () {},
          icon: const Icon(Icons.favorite_outline, size: 18, color: Colors.white)),
    ],
  );
}

Widget buttonResourceItemSmall() {
  return Row(
    children: [
      IconButton(
          padding: isWebMobile ? EdgeInsets.zero : null,
          visualDensity: isWebMobile
              ? const VisualDensity(horizontal: -4, vertical: -4)
              : VisualDensity.compact,
          onPressed: () {},
          icon: const Icon(Icons.more_horiz, size: 18, color: Colors.white)),
    ],
  );
}
