import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListBigResource extends StatefulWidget {
  const ListBigResource({super.key});

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
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 24.0, top: 6.0, left: 24.0, right: 24.0),
        child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return ConstrainedBox(
                constraints: const BoxConstraints(
                    minHeight: 100.0,
                    maxHeight: 150.0,
                    minWidth: 250.0,
                    maxWidth: double.infinity),
                child: InkWell(
                  onHover: ((value) => setState(() => selectedIndex = index)),
                  onTap: () => Navigator.pushNamed(context, '/resource/detail'),
                  child: Card(
                    elevation: (selectedIndex == index) ? 1 : 0,
                    surfaceTintColor: Colors.green,
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    shape: (selectedIndex == index)
                        ? RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(12.0),
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
                                padding: const EdgeInsets.all(8.0),
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image(
                                        image: AssetImage(images[index]),
                                        fit: BoxFit.fitHeight),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'Hello Cat',
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: -1.0),
                                          ),
                                          Text(
                                            'Legends of Zelda',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 0),
                                          ),
                                        ]),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 4.0),
                                      child: Chip(
                                          labelStyle: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
                                          label: const Text('Animal'),
                                          backgroundColor: Colors.grey.shade200,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0, vertical: 0.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Icon(Icons.more_vert),
                              Tooltip(
                                message: "Download 'Legends of Zelda'",
                                child: ElevatedButton.icon(
                                  onPressed: () => Navigator.pushNamed(
                                      context, '/resource/detail'),
                                  label: const Text("4.31 MB"),
                                  icon: const Icon(
                                    Icons.file_download_outlined,
                                    size: 22.0,
                                  ),
                                  style: ButtonStyle(
                                    padding: selectedIndex == index
                                        ? null
                                        : const MaterialStatePropertyAll(
                                            EdgeInsets.only(right: 8.0)),
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
