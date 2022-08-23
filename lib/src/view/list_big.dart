import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
    return Flexible(
      child: AnimatedPadding(
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 600),
        padding: widget.useVerticalLayout
            ? const EdgeInsets.only(bottom: 0, top: 6, left: 24, right: 24)
            : const EdgeInsets.only(bottom: 0, top: 6, left: 0, right: 0),
        child: ListView.builder(
            controller: widget.scrollViewController,
            itemCount: widget.foundResource.length,
            itemBuilder: (context, index) {
              return ConstrainedBox(
                constraints: const BoxConstraints(
                    minHeight: 100,
                    maxHeight: 150,
                    minWidth: 250,
                    maxWidth: double.infinity),
                child: InkWell(
                  onHover: ((value) => setState(() => selectedIndex = index)),
                  onTap: () => Navigator.pushNamed(context, '/resource/detail'),
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
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image(
                                        image: AssetImage(images[index]),
                                        fit: BoxFit.fitHeight),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
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
                                            widget.foundResource[index]["name"]
                                                .toString(),
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
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Row(
                                        children: [
                                          Chip(
                                              labelStyle: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 10,
                                                  color: Colors.black54),
                                              label: const Text('Animal'),
                                              backgroundColor:
                                                  Colors.grey.shade200,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4,
                                                      vertical: 0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
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
                          padding: const EdgeInsets.all(8),
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
                                          color: Colors.black45,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: widget.hideDetailHorizontal
                                        ? true
                                        : false,
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : Colors.grey.shade100,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: IconButton(
                                          color: selectedIndex == index
                                              ? Colors.black87
                                              : Colors.black54,
                                          onPressed: () {},
                                          iconSize: 20,
                                          icon: const Icon(
                                              Icons.star_border_rounded)),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: selectedIndex == index
                                            ? Colors.white
                                            : Colors.grey.shade100,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: PopupMenuButton(
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: selectedIndex == index
                                            ? Colors.black87
                                            : Colors.black54,
                                      ),
                                      iconSize: 20,
                                      itemBuilder: (context) => [
                                        PopupMenuItem(
                                          value: 1,
                                          child: Row(
                                            children: const [
                                              Icon(Icons.star),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("Get The App")
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          value: 2,
                                          child: Row(
                                            children: const [
                                              Icon(Icons.chrome_reader_mode),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text("About")
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Tooltip(
                                message: "Download 'Legends of Zelda'",
                                child: ElevatedButton.icon(
                                  onPressed: () => Navigator.pushNamed(
                                      context, '/resource/detail'),
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
              );
            }),
      ),
    );
  }
}
