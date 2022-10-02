import 'package:flutter/material.dart';
import 'package:gimmic/assets/functions/platform.dart';
import 'package:gimmic/assets/widgets/chip.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../assets/functions/url.dart';
import '../../assets/widgets/builder.dart';
import '../../assets/widgets/button.dart';
import '../../assets/widgets/menu.dart';

class GridResource extends StatefulWidget {
  final bool useVerticalLayout;
  final bool useVerticalLayout2x;
  final bool useVerticalLayout3x;

  final List<bool> layouts;
  final int gridRowCount;
  final ScrollController scrollViewController;
  final List<Map<String, dynamic>> foundResource;
  const GridResource(
      {super.key,
      required this.layouts,
      required this.useVerticalLayout,
      required this.gridRowCount,
      required this.useVerticalLayout2x,
      required this.useVerticalLayout3x,
      required this.foundResource,
      required this.scrollViewController});

  @override
  State<GridResource> createState() => _GridResourceState();
}

int selectedIndex = -1;

final String timenow = DateFormat("MMMM dd").format(DateTime.now());

List<String> images = [
  "images/hellocat.jpg",
  "images/hellocat1.jpg",
  "images/hellocat.jpg",
  "images/hellocat1.jpg"
];

bool isTileSelected = false;
Widget gridDescription(
    context, setState, layouts, name, widget, selectedIndex, index) {
  return AnimatedSize(
    duration: const Duration(milliseconds: 300),
    curve: Curves.ease,
    child: SizedBox(
      height: layouts[0] ? 0 : null, // TODO: Use this for minimal mode
      child: Visibility(
        maintainAnimation: true,
        maintainState: true,
        visible: layouts[0] ? false : true,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: StatefulBuilder(
            builder: (context, setState) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Theme(
                  data: ThemeData(useMaterial3: true)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ListTileTheme(
                    iconColor: Colors.green,
                    textColor: Colors.green,
                    dense: true,
                    horizontalTitleGap: 0,
                    child: ExpansionTile(
                      maintainState: true,
                      title: MouseRegion(
                        onEnter: (event) =>
                            setState(() => isTileSelected = true),
                        onExit: (event) =>
                            setState(() => isTileSelected = false),
                        child: Text(name,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: widget.useVerticalLayout2x ? 20 : 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -1)),
                      ),
                      subtitle: MouseRegion(
                        onEnter: (event) =>
                            setState(() => isTileSelected = true),
                        onExit: (event) =>
                            setState(() => isTileSelected = false),
                        child: Text(widget.foundResource[index]["subname"],
                            style: GoogleFonts.roboto(
                                height: 1,
                                color: Colors.black54,
                                fontSize: widget.useVerticalLayout2x ? 14 : 12,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0)),
                      ),
                      trailing: MouseRegion(
                        onEnter: (event) =>
                            setState(() => isTileSelected = true),
                        onExit: (event) =>
                            setState(() => isTileSelected = false),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                tooltip: 'Add to Favorites',
                                visualDensity: const VisualDensity(
                                    horizontal: -2, vertical: -2),
                                color: selectedIndex == index
                                    ? Colors.black87
                                    : Colors.black54,
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_border)),
                            const SizedBox(width: 6),
                            SizedBox(
                                child: selectedIndex == index
                                    ? isTileSelected
                                        ? Icon(Icons.expand_circle_down,
                                            color: Colors.green.shade600)
                                        : const Icon(
                                            Icons.expand_circle_down_outlined,
                                            color: Colors.black87)
                                    : const Icon(
                                        Icons.expand_circle_down_outlined,
                                        color: Colors.black54)),
                          ],
                        ),
                      ),
                      children: <Widget>[
                        AnimatedPadding(
                          duration: const Duration(milliseconds: 400),
                          padding: isWebMobile
                              ? const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5)
                              : selectedIndex == index
                                  ? const EdgeInsets.only(left: 10, right: 10)
                                  : const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              AnimatedSize(
                                curve: Curves.fastOutSlowIn,
                                duration: const Duration(milliseconds: 400),
                                child: SizedBox(
                                    height:
                                        selectedIndex == index || isWebMobile
                                            ? null
                                            : 10,
                                    child: const Padding(
                                      padding: EdgeInsets.all(8),
                                      child: SelectableText(
                                          'A cat is a furry animal that has a long tail and sharp claws. Cats are often kept as pets. Cats are lions, tigers, and other wild animals in the same family.'),
                                    )),
                              ),
                              const SizedBox(height: 10),
                              ButtonBar(
                                alignment: MainAxisAlignment.spaceBetween,
                                buttonPadding: EdgeInsets.zero,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, bottom: 5),
                                      child: chipTag(
                                          16.0, 12.0, selectedIndex, index)),
                                  Padding(
                                    padding: selectedIndex == index
                                        ? const EdgeInsets.all(0)
                                        : const EdgeInsets.only(right: 5),
                                    child: downloadButton(
                                        context,
                                        selectedIndex,
                                        index,
                                        widget.foundResource[index]["size"]),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class _GridResourceState extends State<GridResource> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 600),
      padding: widget.useVerticalLayout
          ? const EdgeInsets.only(bottom: 0, top: 6, left: 48, right: 48)
          : const EdgeInsets.only(bottom: 0, top: 6, left: 24, right: 24),
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          controller: widget.scrollViewController,
          itemCount: widget.foundResource.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: widget.useVerticalLayout
                  ? MediaQuery.of(context).size.width / 3.25
                  : 390,
              crossAxisCount: widget.gridRowCount,
              crossAxisSpacing: widget.useVerticalLayout ? 20 : 10,
              mainAxisSpacing: 0),
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

            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: StatefulBuilder(
                builder: (context, setState) => GestureDetector(
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
                    onEnter: (event) => setState(() => selectedIndex = index),
                    onExit: (event) => setState(() => selectedIndex = -1),
                    child: Hero(
                      tag: hero + i.toString(),
                      child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          elevation: (selectedIndex == index) ? 10 : 0,
                          shadowColor:
                              widget.layouts[0] ? Colors.green : Colors.black,
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                  width: 2,
                                  color: (selectedIndex == index)
                                      ? Colors.green
                                      : Colors.transparent)),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            color: (selectedIndex == index)
                                ? Colors.lightGreen.shade50
                                : Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: AnimatedContainer(
                                    curve: Curves.fastOutSlowIn,
                                    duration: const Duration(milliseconds: 300),
                                    child:
                                        Stack(fit: StackFit.expand, children: [
                                      ClipRect(
                                        child: AnimatedScale(
                                          curve: Curves.easeOutQuart,
                                          duration:
                                              const Duration(milliseconds: 600),
                                          scale:
                                              selectedIndex == index ? 1.05 : 1,
                                          child: Image(
                                            image: AssetImage(images[index]),
                                            fit: BoxFit.cover,
                                            frameBuilder: (BuildContext context,
                                                    Widget child,
                                                    int? frame,
                                                    bool
                                                        wasSynchronouslyLoaded) =>
                                                imageFrameBulilder(child, frame,
                                                    wasSynchronouslyLoaded),
                                            loadingBuilder:
                                                (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) =>
                                                    imageLoadingBuilder(
                                                        child, loadingProgress),
                                          ),
                                        ),
                                      ),
                                      AnimatedOpacity(
                                        opacity: selectedIndex == index ||
                                                isWebMobile
                                            ? 1
                                            : 0,
                                        duration:
                                            const Duration(milliseconds: 200),
                                        child: Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: buttonMoreMenu(
                                                  currentUrl(context,
                                                      "/${name.toLowerCase()}"),
                                                  images[index],
                                                  hero + i.toString(),
                                                  pushNamed),
                                            )),
                                      ),
                                    ]),
                                  ),
                                ),
                                gridDescription(
                                    context,
                                    setState,
                                    widget.layouts,
                                    name,
                                    widget,
                                    selectedIndex,
                                    index)
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
