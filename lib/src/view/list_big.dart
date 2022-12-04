import 'package:flutter/material.dart';
import 'package:gimmic/assets/functions/platform.dart';
import 'package:gimmic/assets/functions/string.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../assets/functions/scroll.dart';
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

final GlobalKey<State<StatefulWidget>> _imageIndicatorKey = GlobalKey<State<StatefulWidget>>();

// image indicators
List<Widget> imageIndicators(imagesLength, currentIndex, layout) {
  return List<Widget>.generate(imagesLength, (index) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.all(1),
        width: 3,
        height: 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.7),
          color: currentIndex == index ? Colors.black54 : Colors.black26,
        ),
      ),
    );
  });
}

class _ListBigResourceState extends State<ListBigResource> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 600),
      padding: widget.useVerticalLayout
          ? const EdgeInsets.only(bottom: 0, top: 18, left: 24, right: 24)
          : const EdgeInsets.only(bottom: 0, top: 18, left: 0, right: 0),
      child: LayoutBuilder(
        builder: (context, constraints) =>
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            controller: widget.scrollViewController,
            itemCount: widget.foundResource.length,
            itemBuilder: (context, index) {
              String name = widget.foundResource[index]['name'];
              String hero = 'test';
              int i = 1;
              int pageIndex = 0;

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
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 300),
                    scale: selectedIndex == index
                      ? 1.025
                      : 1,
                    child: SizedBox(
                      height: isTileExpanded ? 250 : widget.hideDetailHorizontal ? 150 : 125,
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
                                ? const EdgeInsets.only(bottom: 16)
                                : const EdgeInsets.only(bottom: 16, left: 25, right: 25),
                            // key: ValueKey(widget.foundResource[index]["id"]),
                            elevation: selectedIndex == index ? 6 : 2,
                            shadowColor: Colors.black38,
                            surfaceTintColor: Colors.green.shade100,
                            color: Colors.white,
                            shape: selectedIndex == index
                                ? RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Colors.green, width: 2),
                                    borderRadius: BorderRadius.circular(12),
                                  )
                                : null,
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                              color: selectedIndex == index ? null : Colors.white,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: InkWell(
                                            onTap: () => imageDialogHero(context, images[index], hero + i.toString(), null),
                                            child: AnimatedSize(
                                              curve: Curves.fastOutSlowIn,
                                              duration: const Duration(milliseconds: 300),
                                              child: Stack(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(10),
                                                    child: Hero(
                                                      tag: hero + i.toString(),
                                                      child: AnimatedSwitcher(
                                                        duration: const Duration(milliseconds: 300),
                                                        child: AspectRatio(
                                                          aspectRatio: widget.hideDetailHorizontal ? 1 / 0.75 : 1 / 0.9,
                                                          child: ScrollConfiguration(
                                                            behavior: DragOnScroll(),
                                                            child: PageView.builder(
                                                              onPageChanged: (value) {
                                                                _imageIndicatorKey.currentState?.setState(() {
                                                                    pageIndex = value;
                                                                });
                                                              },
                                                              pageSnapping: true,
                                                              physics: const BouncingScrollPhysics(),
                                                              itemCount: widget.foundResource[index]["images"].length,
                                                              itemBuilder: (context, i) =>
                                                              Image(
                                                                image: MemoryImage(widget.foundResource[index]["images"][i]),
                                                                fit: BoxFit.cover),
                                                            ),
                                                        ))
                                                      ),
                                                    ),
                                                  ),
                                                  Visibility(
                                                    visible: widget.foundResource[index]["images"].length == 1
                                                    ? false : true,
                                                    child: Align(
                                                      alignment: Alignment.bottomCenter,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8),
                                                        child: StatefulBuilder(
                                                          key: _imageIndicatorKey,
                                                          builder: (context, setState) =>
                                                          Row(
                                                            children: imageIndicators(
                                                              widget.foundResource[index]["images"].length,
                                                              pageIndex,
                                                              widget.hideDetailHorizontal
                                                            )
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(4, 8, 8, isWebMobile ? 0 : 4),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      name,
                                                      style: TextStyle(
                                                          color: Colors.black87,
                                                          fontSize: widget.hideDetailHorizontal ? 20 : 16,
                                                          fontWeight: FontWeight.w500,
                                                          letterSpacing: -0.5),
                                                    ),
                                                    Text(
                                                      widget.foundResource[index]["brand"].toString().toTitleCase(),
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.black54,
                                                          fontSize: widget.hideDetailHorizontal ? 14 : 12,
                                                          fontWeight: FontWeight.w500,
                                                          letterSpacing: 0),
                                                    ),
                                                    const SizedBox(height: 16),
                                                    AnimatedSize(duration: const Duration(milliseconds: 200),
                                                      reverseDuration: Duration.zero,
                                                      child: SizedBox(
                                                        width: isTileExpanded
                                                            ? MediaQuery.of(context).size.width - 700
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
                                                padding: EdgeInsets.only(bottom: isWebMobile ? 4 : 8),
                                                child: Wrap(
                                                  spacing: 8,
                                                  children: [
                                                    Chip(
                                                      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                                                      labelPadding: EdgeInsets.zero,
                                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                                      side: BorderSide.none,
                                                      backgroundColor: selectedIndex == index
                                                        ? Colors.green.shade50
                                                        : Colors.deepPurple.withOpacity(0.025),
                                                      label: Icon(
                                                        selectedIndex == index 
                                                          ? Icons.directions_car
                                                          : Icons.directions_car_outlined, 
                                                        color: Colors.grey.shade700, 
                                                        size: 18),
                                                    ),
                                                    SizedBox(
                                                      width: widget.hideDetailHorizontal
                                                        ? constraints.maxWidth / 2
                                                        : constraints.maxWidth / 2.35,
                                                      child: ScrollConfiguration(
                                                        behavior: DragOnScroll(),
                                                        child: SingleChildScrollView(
                                                          scrollDirection: Axis.horizontal,
                                                          child: Wrap(
                                                            spacing: 8,
                                                            children: List.generate(widget.foundResource[index]['tags'].length, (i) {
                                                              return FilterChip(
                                                                visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                                                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                                                labelPadding: EdgeInsets.zero,
                                                                side: BorderSide.none,
                                                                backgroundColor: selectedIndex == index
                                                                  ? Colors.green.shade50
                                                                  : Colors.deepPurple.withOpacity(0.025),
                                                                onSelected: (value) {},
                                                                label: Text(
                                                                  widget.foundResource[index]['tags'][i],
                                                                  style: TextStyle(
                                                                    color: Colors.black54,
                                                                    fontSize: widget.hideDetailHorizontal ? 12 : 10, fontWeight: FontWeight.w600)
                                                                ),
                                                              );
                                                            })
                                                          ),
                                                        ),
                                                      ),
                                                    ),
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
                                    padding: EdgeInsets.fromLTRB(8, isWebMobile ? 0 : 8, 4, isWebMobile ? 0 : 8),
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
                                              child: FilterChip(
                                                onSelected: (value) {},
                                                visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                                                backgroundColor: selectedIndex == index
                                                  ? Colors.green.shade50
                                                  : Colors.deepPurple.withOpacity(0.025),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.7)),
                                                side: BorderSide.none,
                                                label: Text(
                                                  widget.foundResource[index]["time"],
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
                                                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                                color: selectedIndex == index
                                                    ? Colors.black87
                                                    : Colors.black54,
                                                onPressed: () {},
                                                iconSize: widget.hideDetailHorizontal ? 20 : 16,
                                                icon: const Icon(Icons.favorite_border)),
                                            PopupMenuButton<int>(
                                                elevation: 4,
                                                padding: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                                icon: IconButton(
                                                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                                  onPressed: () {},
                                                  icon: const Icon(Icons.more_vert),
                                                  color: selectedIndex == index
                                                      ? Colors.black87
                                                      : Colors.black54,
                                                ),
                                                iconSize: widget.hideDetailHorizontal ? 20 : 16,
                                                itemBuilder: (context) {
                                                  return openPopMenu(
                                                    context,
                                                    currentUrl(context, "/${name.toLowerCase()}"),
                                                    pushNamed) +
                                                  openImagePopMenu(
                                                    context,
                                                    images[index],
                                                    hero + i.toString()) +
                                                  openDividerMenu +
                                                  openItemMenu(context, currentUrl(context, "/${name.toLowerCase()}"));
                                                })
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            AnimatedOpacity(
                                              duration: const Duration(milliseconds: 200),
                                              curve: Curves.fastOutSlowIn,
                                              opacity: selectedIndex == index
                                              ? 1
                                              : 0,
                                              child: Visibility(
                                                visible: widget.useVerticalLayout
                                                ? true
                                                : false,
                                                child: TextButton.icon(style: const ButtonStyle(
                                                    visualDensity: VisualDensity(vertical: -3)),
                                                  onPressed: () {
                                                    bool value;
                                                    isTileExpanded
                                                    ? value = false
                                                    : value = true;
                                                    setState(() => isTileExpanded = value);
                                                  },
                                                  icon: Text(isTileExpanded
                                                    ? ' See Less'
                                                    : ' See More',
                                                    style: GoogleFonts.roboto(
                                                      color: Colors.black54,
                                                      fontWeight:FontWeight.w500,
                                                      fontSize: 12)),
                                                  label: Icon(isTileExpanded
                                                    ? Icons.expand_less
                                                    : Icons.expand_more,
                                                    size: 14,
                                                    color: Colors.black54)),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Padding(
                                              padding: widget.hideDetailHorizontal
                                                ? EdgeInsets.only(
                                                  right: selectedIndex == index ? 7 : 12)
                                                : const EdgeInsets.only(right: 4),
                                              child: widget.hideDetailHorizontal
                                                ? downloadButton(context, selectedIndex, index, 'Download')
                                                : IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.file_download_outlined,
                                                      size: 22,
                                                    ),
                                                    color: Colors.green,
                                                    visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
                                                  )
                                              )
                                          ],
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
                  ),
                ),
              );
            }),
      ),
    );
  }
}
