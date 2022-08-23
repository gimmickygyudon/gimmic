import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GridResource extends StatefulWidget {
  // const GridResource({super.key});

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
      onPressed: () => Navigator.pushNamed(context, '/resource/detail'),
      label: Text(size,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w700,
          )),
      icon: const Icon(
        Icons.file_download_outlined,
        size: 22,
      ),
      style: ButtonStyle(
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
      onPressed: () => Navigator.pushNamed(context, '/resource/detail'),
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
    return Flexible(
      child: AnimatedPadding(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 600),
        padding: widget.useVerticalLayout
            ? const EdgeInsets.only(bottom: 0, top: 6, left: 48, right: 48)
            : const EdgeInsets.only(bottom: 0, top: 6, left: 24, right: 24),
        child: GridView.builder(
            controller: widget.scrollViewController,
            itemCount: widget.foundResource.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: widget.useVerticalLayout2x ? 420 : 400,
                crossAxisCount: widget.gridRowCount,
                crossAxisSpacing: widget.useVerticalLayout ? 40 : 20,
                mainAxisSpacing: 0),
            itemBuilder: (context, index) {
              return InkWell(
                onHover: ((value) => setState(() => selectedIndex = index)),
                onTap: () => Navigator.pushNamed(context, '/resource/detail'),
                child: Card(
                    margin: const EdgeInsets.only(bottom: 30),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: (selectedIndex == index) ? 1 : 0,
                    surfaceTintColor: Colors.green,
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    shape: (selectedIndex == index)
                        ? RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.green, width: 3),
                            borderRadius: BorderRadius.circular(12),
                          )
                        : RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.white38, width: 3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            foregroundDecoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: selectedIndex == index
                                        ? [0.3, 0.95, 1.0]
                                        : [0.3, 0.9, 1.0],
                                    colors: const [
                                  Colors.transparent,
                                  Colors.white38,
                                  Colors.white
                                ])),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                              child: Image(
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 6, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.foundResource[index]["name"],
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: widget.useVerticalLayout2x
                                              ? 24
                                              : 18,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: -1),
                                    ),
                                    Text(timenow,
                                        style: GoogleFonts.roboto(
                                          color: Colors.black45,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ))
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                widget.foundResource[index]["subname"],
                                style: GoogleFonts.roboto(
                                    color: Colors.black54,
                                    fontSize:
                                        widget.useVerticalLayout2x ? 14 : 12,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceBetween,
                          buttonPadding: const EdgeInsets.only(
                              top: 20, left: 10, right: 20, bottom: 20),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Chip(
                                  labelStyle: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 12,
                                      color: Colors.black54),
                                  label: const Text('Animal'),
                                  backgroundColor: Colors.grey.shade200,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )),
                            ),
                            Padding(
                              padding: selectedIndex == index
                                  ? const EdgeInsets.all(0)
                                  : const EdgeInsets.only(right: 5),
                              child: downloadButton(context, selectedIndex,
                                  index, widget.foundResource[index]["size"]),
                            )
                          ],
                        ),
                      ],
                    )),
              );
            }),
      ),
    );
  }
}
