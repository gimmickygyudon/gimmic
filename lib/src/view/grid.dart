import 'package:flutter/material.dart';
import 'package:gimmic/assets/functions/platform.dart';
import 'package:gimmic/assets/widgets/chip.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../assets/widgets/builder.dart';
import '../../assets/widgets/button.dart';

class GridResource extends StatefulWidget {
  final bool useVerticalLayout;
  final bool useVerticalLayout2x;
  final bool useVerticalLayout3x;
  final int gridRowCount;
  final ScrollController scrollViewController;
  final List<Map<String, dynamic>> foundResource;
  const GridResource(
      {super.key,
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

Widget downloadButton(context, selectedIndex, index, size) {
  return Tooltip(
    message: "Download 'Legends of Zelda'",
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
        padding: selectedIndex == index
            ? null
            : const MaterialStatePropertyAll(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(
            selectedIndex == index ? Colors.green : Colors.transparent),
        foregroundColor: selectedIndex == index
            ? MaterialStateProperty.resolveWith((states) {
                return states.contains(MaterialState.hovered)
                    ? Colors.white
                    : Colors.white;
              })
            : MaterialStateProperty.resolveWith((states) {
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
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: InkWell(
                onHover: ((value) => setState(() => selectedIndex = index)),
                onTap: () => context.pushNamed('details', params: {
                  'name': widget.foundResource[index]['name'].toLowerCase(),
                }, extra: {
                  "name": "${widget.foundResource[index]['name']}",
                  "hero": "${widget.foundResource[index]['hero']}",
                  "index": '${widget.foundResource[index]['index']}'
                }),
                child: Hero(
                  tag: widget.foundResource[index]["hero"] +
                      widget.foundResource[index]["index"].toString(),
                  child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: (selectedIndex == index) ? 10 : 0,
                      shadowColor: Colors.black,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                              width: 3,
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
                                foregroundDecoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: selectedIndex == index
                                            ? [0.3, 0.95, 1.0]
                                            : [0.3, 0.9, 1.0],
                                        colors: [
                                      Colors.transparent,
                                      Colors.white38,
                                      selectedIndex == index
                                          ? Colors.green.shade50
                                          : Colors.white
                                    ])),
                                child: Stack(fit: StackFit.expand, children: [
                                  Image(
                                    image: AssetImage(images[index]),
                                    fit: BoxFit.cover,
                                    frameBuilder: (BuildContext context,
                                            Widget child,
                                            int? frame,
                                            bool wasSynchronouslyLoaded) =>
                                        imageFrameBulilder(child, frame,
                                            wasSynchronouslyLoaded),
                                    loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) =>
                                        imageLoadingBuilder(
                                            child, loadingProgress),
                                  ),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: buttonMoreMenu(),
                                      )),
                                ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Theme(
                                    data: ThemeData(useMaterial3: true)
                                        .copyWith(
                                            dividerColor: Colors.transparent),
                                    child: ListTileTheme(
                                      iconColor: Colors.green,
                                      textColor: Colors.green,
                                      dense: true,
                                      horizontalTitleGap: 0,
                                      child: ExpansionTile(
                                        controlAffinity:
                                            ListTileControlAffinity.leading,
                                        title: Text(
                                            widget.foundResource[index]["name"],
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize:
                                                    widget.useVerticalLayout2x
                                                        ? 20
                                                        : 16,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: -1)),
                                        subtitle: Text(
                                            widget.foundResource[index]
                                                ["subname"],
                                            style: GoogleFonts.roboto(
                                                height: 1,
                                                color: Colors.black54,
                                                fontSize:
                                                    widget.useVerticalLayout2x
                                                        ? 14
                                                        : 12,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0)),
                                        trailing: IconButton(
                                            visualDensity: const VisualDensity(
                                                horizontal: -2, vertical: -2),
                                            color: selectedIndex == index
                                                ? Colors.black87
                                                : Colors.black54,
                                            onPressed: () {},
                                            iconSize: 20,
                                            icon: const Icon(
                                                Icons.favorite_border)),
                                        children: <Widget>[
                                          const SizedBox(height: 16),
                                          AnimatedPadding(
                                            duration: const Duration(
                                                milliseconds: 400),
                                            padding: isWebMobile
                                                ? const EdgeInsets.symmetric(
                                                    horizontal: 10, vertical: 5)
                                                : selectedIndex == index
                                                    ? const EdgeInsets.only(
                                                        left: 10,
                                                        right: 10,
                                                        bottom: 5)
                                                    : const EdgeInsets.only(
                                                        left: 10, right: 10),
                                            child: ButtonBar(
                                              alignment: MainAxisAlignment
                                                  .spaceBetween,
                                              buttonPadding: EdgeInsets.zero,
                                              children: [
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: chipTag(16.0, 12.0)),
                                                Padding(
                                                  padding: selectedIndex ==
                                                          index
                                                      ? const EdgeInsets.all(0)
                                                      : const EdgeInsets.only(
                                                          right: 5),
                                                  child: downloadButton(
                                                      context,
                                                      selectedIndex,
                                                      index,
                                                      widget.foundResource[
                                                          index]["size"]),
                                                )
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
                          ],
                        ),
                      )),
                ),
              ),
            );
          }),
    );
  }
}
