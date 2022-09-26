import 'package:flutter/material.dart';
import 'package:gimmic/assets/functions/platform.dart';
import 'package:gimmic/assets/widgets/chip.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../assets/functions/url.dart';
import '../../assets/widgets/dialog.dart';
import '../../assets/widgets/menu.dart';

class ListBigResource extends StatefulWidget {
  final List<Map<String, dynamic>> foundResource;
  final bool layouts;
  final bool useVerticalLayout;
  final bool hideDetailHorizontal;
  final ScrollController scrollViewController;
  const ListBigResource(
      {super.key,
      required this.foundResource,
      required this.layouts,
      required this.hideDetailHorizontal,
      required this.useVerticalLayout,
      required this.scrollViewController});

  @override
  State<ListBigResource> createState() => _ListBigResourceState();
}

int selectedIndex = -1;
final String timenow = DateFormat("MMMM dd").format(DateTime.now());

List<String> images = [
  "images/hellocat.jpg",
  "images/hellocat1.jpg",
  "images/hellocat.jpg",
  "images/hellocat1.jpg"
];

class _ListBigResourceState extends State<ListBigResource> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 600),
      padding: widget.useVerticalLayout
          ? const EdgeInsets.only(bottom: 0, top: 6, left: 24, right: 24)
          : const EdgeInsets.only(bottom: 0, top: 6, left: 0, right: 0),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          controller: widget.scrollViewController,
          itemCount: widget.foundResource.length,
          itemBuilder: (context, index) {
            String name = widget.foundResource[index]['name'];
            String hero = widget.foundResource[index]['hero'];
            int i = widget.foundResource[index]["index"];

            void pushNamed() {
              context.pushNamed('details', params: {
                'name': name.toLowerCase(),
              }, extra: {
                "name": name,
                "hero": hero,
                "index": '$i'
              });
            }

            return ConstrainedBox(
              constraints: const BoxConstraints(
                  minHeight: 100,
                  maxHeight: 150,
                  minWidth: 250,
                  maxWidth: double.infinity),
              child: GestureDetector(
                onSecondaryTapDown: (details) => onRightClickMenu(
                    context,
                    currentUrl(context, "/${name.toLowerCase()}"),
                    images[index],
                    hero + i.toString(),
                    pushNamed,
                    details),
                onLongPress: () => onRightClickMenu(
                    context,
                    currentUrl(context, "/${name.toLowerCase()}"),
                    images[index],
                    hero + i.toString(),
                    pushNamed),
                onTapDown: (details) => onTapPosition(details),
                child: InkWell(
                  onHover: ((value) => setState(() => selectedIndex = index)),
                  onTap: () => pushNamed(),
                  child: Card(
                    margin: widget.layouts
                        ? const EdgeInsets.only(bottom: 10)
                        : const EdgeInsets.only(
                            bottom: 10, left: 25, right: 25),
                    key: ValueKey(widget.foundResource[index]["id"]),
                    elevation: (selectedIndex == index) ? 1 : 0,
                    surfaceTintColor: Colors.green,
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    shape: (selectedIndex == index)
                        ? RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          )
                        : null,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: InkWell(
                                    onTap: () => imageDialogHero(
                                        context,
                                        images[index],
                                        hero + i.toString(),
                                        null),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Hero(
                                        tag: hero + i.toString(),
                                        child: Image(
                                            image: AssetImage(images[index]),
                                            fit: BoxFit.fitHeight),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    8, 8, 8, isWebMobile ? 0 : 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            name.toString(),
                                            style: const TextStyle(
                                                color: Colors.black87,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: -0.5),
                                          ),
                                          Text(
                                            widget.foundResource[index]
                                                    ["subname"]
                                                .toString(),
                                            style: GoogleFonts.roboto(
                                                color: Colors.black54,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0),
                                          ),
                                        ]),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: isWebMobile ? 0 : 4),
                                      child: Row(
                                        children: [
                                          chipTag(14.0, 10.0),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              8,
                              isWebMobile ? 4 : 8,
                              8,
                              isWebMobile
                                  ? 0
                                  : selectedIndex == index
                                      ? 8
                                      : 4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Visibility(
                                    visible: widget.hideDetailHorizontal
                                        ? true
                                        : false,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Text(
                                        timenow,
                                        style: GoogleFonts.roboto(
                                          color: selectedIndex == index
                                              ? Colors.black87
                                              : Colors.black45,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      visualDensity: const VisualDensity(
                                          horizontal: -2, vertical: -2),
                                      color: selectedIndex == index
                                          ? Colors.black87
                                          : Colors.black54,
                                      onPressed: () {},
                                      iconSize: 20,
                                      icon: const Icon(Icons.favorite_border)),
                                  PopupMenuButton<int>(
                                      elevation: 4,
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: selectedIndex == index
                                            ? Colors.black87
                                            : Colors.black54,
                                      ),
                                      iconSize: 20,
                                      itemBuilder: (context) {
                                        return openPopMenu(
                                                context,
                                                currentUrl(context,
                                                    "/${name.toLowerCase()}"),
                                                pushNamed) +
                                            openImagePopMenu(
                                                context,
                                                images[index],
                                                hero + i.toString()) +
                                            openDividerMenu +
                                            openItemMenu(
                                                context,
                                                currentUrl(context,
                                                    "/${name.toLowerCase()}"));
                                      })
                                ],
                              ),
                              Tooltip(
                                message: "Download 'Legends of Zelda'",
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  label: Text(
                                    widget.foundResource[index]["size"]
                                        .toString(),
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.file_download_outlined,
                                    size: 22,
                                  ),
                                  style: ButtonStyle(
                                    visualDensity: const VisualDensity(
                                        horizontal: -2, vertical: -2),
                                    padding: selectedIndex == index
                                        ? null
                                        : const MaterialStatePropertyAll(
                                            EdgeInsets.only(right: 8)),
                                    backgroundColor: MaterialStateProperty.all(
                                        selectedIndex == index
                                            ? Colors.green
                                            : Colors.transparent),
                                    foregroundColor: selectedIndex == index
                                        ? MaterialStateProperty.resolveWith(
                                            (states) {
                                            return states.contains(
                                                    MaterialState.hovered)
                                                ? Colors.white
                                                : Colors.white;
                                          })
                                        : MaterialStateProperty.resolveWith(
                                            (states) {
                                            return states.contains(
                                                    MaterialState.hovered)
                                                ? Colors.white
                                                : Colors.green;
                                          }),
                                    elevation:
                                        const MaterialStatePropertyAll(0),
                                    overlayColor:
                                        MaterialStateProperty.resolveWith(
                                      (states) {
                                        return states
                                                .contains(MaterialState.pressed)
                                            ? Colors.green.shade700
                                            : Colors.green.shade500;
                                      },
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
