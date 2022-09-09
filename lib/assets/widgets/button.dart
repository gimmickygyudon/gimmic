import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gimmic/assets/functions/platform.dart';
import 'package:gimmic/assets/functions/url.dart';
import 'package:gimmic/assets/widgets/dialog.dart';
import 'package:google_fonts/google_fonts.dart';

Widget iconImageDialog(context, images, hero, color) {
  return Row(
    children: [
      Tooltip(
        message: 'Quick View',
        child: IconButton(
            visualDensity: isWebMobile
                ? const VisualDensity(horizontal: -2, vertical: -2)
                : null,
            padding: EdgeInsets.zero,
            onPressed: () async {
              await imageDialogHero(context, images, hero, null);
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
      buttonMoreMenu()
    ],
  );
}

Widget buttonBigView3D(context, useHorizontalShrink) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Tooltip(
      message: 'Coming Soon',
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/resource/detail/view');
            },
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.view_in_ar_rounded,
                        size: 34, color: Colors.black54),
                    Visibility(
                      visible: useHorizontalShrink ? true : false,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text('View 3D',
                            style: GoogleFonts.roboto(
                                color: Colors.black54,
                                fontWeight: FontWeight.w700)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buttonGithub() {
  return ElevatedButton.icon(
    style: ButtonStyle(
        visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
        alignment: Alignment.center,
        backgroundColor: MaterialStateProperty.resolveWith(((states) {
          return states.contains(MaterialState.hovered)
              ? Colors.grey.shade800
              : Colors.grey.shade700;
        }))).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
    onPressed: () => urlLink('https://github.com/gimmickygyudon/gimmic/'),
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

Widget buttonNotification() {
  return ElevatedButton.icon(
      style: const ButtonStyle(
              visualDensity: VisualDensity(horizontal: -2, vertical: -2),
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              alignment: Alignment.center)
          .copyWith(elevation: ButtonStyleButton.allOrNull(0)),
      icon: const Icon(Icons.notifications_none_outlined),
      onPressed: () {},
      label: Text('0', style: GoogleFonts.roboto(fontWeight: FontWeight.w500)));
}

Widget buttonView3DIcon(context) {
  return Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
        color: Colors.black45, borderRadius: BorderRadius.circular(12)),
    child: IconButton(
        visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
        tooltip: '3D View',
        hoverColor: Colors.transparent,
        onPressed: () async => await Navigator.pushNamed(
              context,
              '/resource/detail/view',
            ),
        icon: const Icon(Icons.view_in_ar_rounded, color: Colors.white)),
  );
}

Widget buttonView3D(context) {
  return ElevatedButton.icon(
      style: const ButtonStyle(
          visualDensity: VisualDensity(horizontal: -2, vertical: -2),
          backgroundColor: MaterialStatePropertyAll(Colors.black45),
          elevation: MaterialStatePropertyAll(0),
          padding: MaterialStatePropertyAll(EdgeInsets.all(16))),
      onPressed: () async => await Navigator.pushNamed(
            context,
            '/resource/detail/view',
          ),
      icon: Icon(Icons.view_in_ar_rounded, color: Colors.blue.shade100),
      label: Text(
        '3D View',
        style: GoogleFonts.roboto(
            fontWeight: FontWeight.w400, color: Colors.blue.shade100),
      ));
}

Widget buttonMoreMenu() {
  return PopupMenuButton<int>(
    elevation: 1,
    padding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: const BorderSide(width: 1, color: Colors.black12)),
    icon: const Icon(
      Icons.more_vert,
      color: Colors.white,
      shadows: [
        Shadow(color: Colors.black26, offset: Offset(1, 1), blurRadius: 2),
      ],
    ),
    iconSize: 20,
    itemBuilder: (context) => [
      PopupMenuItem(
        value: 1,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
          child: Row(
            children: [
              const Icon(Icons.favorite_border, color: Colors.black54),
              const SizedBox(
                width: 10,
              ),
              Text("Add to Favorites",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500, color: Colors.grey.shade800))
            ],
          ),
        ),
      ),
      PopupMenuItem(
        value: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Row(
            children: [
              const Icon(Icons.share_outlined, color: Colors.black54),
              const SizedBox(
                width: 10,
              ),
              Text("Share",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500, color: Colors.grey.shade800))
            ],
          ),
        ),
      ),
      PopupMenuItem(
        value: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Row(
            children: [
              const Icon(Icons.link_outlined, color: Colors.black54),
              const SizedBox(
                width: 10,
              ),
              Text("Copy Link",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500, color: Colors.grey.shade800))
            ],
          ),
        ),
      ),
      const PopupMenuDivider(),
      PopupMenuItem(
        value: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Row(
            children: [
              Icon(Icons.not_interested_outlined,
                  color: Colors.yellow.shade800),
              const SizedBox(
                width: 10,
              ),
              Text("Not Interested",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      color: Colors.yellow.shade800))
            ],
          ),
        ),
      ),
      PopupMenuItem(
        value: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Row(
            children: [
              Icon(Icons.flag, color: Colors.red.shade800),
              const SizedBox(
                width: 10,
              ),
              Text("Report Item",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500, color: Colors.red.shade800))
            ],
          ),
        ),
      ),
    ],
  );
}

class ButtonLinks extends StatelessWidget {
  ButtonLinks({super.key, required this.bgcolor});

  final bgcolor;
  final List<String> links = [
    "https://www.instagram.com/gimmickygyudon/",
    "https://twitter.com/GimmickyGyudon",
    "https://github.com/gimmickygyudon/gimmic/"
  ];
  final List<String> linksName = ["Instagram", "Twitter", "Github"];
  final List linksIcon = [
    FontAwesomeIcons.instagram,
    FontAwesomeIcons.twitter,
    FontAwesomeIcons.github
  ];

  @override
  Widget build(BuildContext context) {
    return IconButton(
        tooltip: 'Open Links',
        icon: Container(
          decoration: BoxDecoration(
              color: bgcolor, borderRadius: BorderRadius.circular(25.7)),
          padding: const EdgeInsets.all(6),
          child: Icon(
            Icons.link,
            color: Colors.grey.shade800,
          ),
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
                                      message: links[index],
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
                                                color: Colors.grey.shade800,
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
                                              urlLink(links[index])),
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
