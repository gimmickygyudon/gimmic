import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gimmic/assets/functions/platform.dart';
import 'package:gimmic/assets/widgets/chip.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../assets/functions/url.dart';
import '../../assets/widgets/button.dart';
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

            bool isTileExpanded = false;
            return StatefulBuilder(
              builder: (context, setState) => AnimatedSize(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 300),
                child: SizedBox(
                  height: isTileExpanded ? 250 : 150,
                  width: double.infinity,
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
                    onTap: () => pushNamed(),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (event) => setState(() => selectedIndex = index),
                      onExit: (event) => setState(() => selectedIndex = -1),
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
                                side: const BorderSide(
                                    color: Colors.green, width: 2),
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
                                    child: InkWell(
                                      onTap: () => imageDialogHero(
                                          context,
                                          images[index],
                                          hero + i.toString(),
                                          null),
                                      child: AnimatedSize(
                                        curve: Curves.fastOutSlowIn,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Hero(
                                            tag: hero + i.toString(),
                                            child: AnimatedSwitcher(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              child: widget.hideDetailHorizontal
                                                  ? Image(
                                                      image: AssetImage(
                                                          images[index]),
                                                      fit: BoxFit.cover)
                                                  : AspectRatio(
                                                      aspectRatio: 1 / 1,
                                                      child: Image(
                                                          image: AssetImage(
                                                              images[index]),
                                                          fit: BoxFit.cover),
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        8, 8, 8, isWebMobile ? 0 : 4),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
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
                                              const SizedBox(height: 16),
                                              AnimatedSize(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                reverseDuration: Duration.zero,
                                                child: SizedBox(
                                                  width: isTileExpanded
                                                      ? MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          700
                                                      : 0,
                                                  child: Visibility(
                                                    visible: isTileExpanded
                                                        ? true
                                                        : false,
                                                    child: SelectableText(
                                                      'A cat is a furry animal that has a long tail and sharp claws. Cats are often kept as pets. Cats are lions, tigers, and other wild animals in the same family.',
                                                      style: GoogleFonts
                                                          .robotoFlex(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: isWebMobile ? 0 : 8),
                                          child: Wrap(
                                            spacing: 8,
                                            children: [
                                              chipTag(14.0, 10.0, selectedIndex,
                                                  index),
                                              Visibility(
                                                visible:
                                                    widget.hideDetailHorizontal
                                                        ? true
                                                        : false,
                                                child: chipTag(
                                                    14.0,
                                                    10.0,
                                                    selectedIndex,
                                                    index,
                                                    'Stray Cat',
                                                    Icons.pets_rounded),
                                              ),
                                              AnimatedOpacity(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                opacity: selectedIndex == index
                                                    ? 1
                                                    : kIsWeb ? 1 : 0,
                                                child: Visibility(
                                                  visible:
                                                      widget.useVerticalLayout
                                                          ? true
                                                          : false,
                                                  child: TextButton.icon(
                                                      style: const ButtonStyle(visualDensity: VisualDensity(vertical: -3)),
                                                      onPressed: () {
                                                        bool value;
                                                        isTileExpanded
                                                            ? value = false
                                                            : value = true;
                                                        setState(() =>
                                                            isTileExpanded =
                                                                value);
                                                      },
                                                      icon: Text(
                                                          isTileExpanded
                                                              ? ' See Less'
                                                              : ' See More',
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  color: Colors
                                                                      .black54,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      12)),
                                                      label: Icon(
                                                          isTileExpanded
                                                              ? Icons
                                                                  .expand_less
                                                              : Icons
                                                                  .expand_more,
                                                          size: 14,
                                                          color:
                                                              Colors.black54)),
                                                ),
                                              )
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
                              padding: EdgeInsets.fromLTRB(8,
                                  isWebMobile ? 4 : 8, 8, isWebMobile ? 0 : 8),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Visibility(
                                        visible: widget.hideDetailHorizontal
                                            ? true
                                            : false,
                                        child: FilterChip(
                                          onSelected: (value) {},
                                          backgroundColor:
                                              selectedIndex == index
                                                  ? Colors.green.shade50
                                                  : null,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25.7)),
                                          side: BorderSide.none,
                                          label: Text(
                                            timenow,
                                            style: GoogleFonts.roboto(
                                              color: selectedIndex == index
                                                  ? Colors.black87
                                                  : Colors.black54,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      IconButton(
                                          visualDensity: const VisualDensity(
                                              horizontal: -2, vertical: -2),
                                          color: selectedIndex == index
                                              ? Colors.black87
                                              : Colors.black54,
                                          onPressed: () {},
                                          iconSize: 20,
                                          icon: const Icon(
                                              Icons.favorite_border)),
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
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: selectedIndex == index ? 7 : 12),
                                    child: downloadButton(
                                        context,
                                        selectedIndex,
                                        index,
                                        widget.foundResource[index]['size']),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
