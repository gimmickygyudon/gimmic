import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GridResource extends StatefulWidget {
  const GridResource({super.key});

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

Widget downloadButton(context) {
  return Tooltip(
    message: "Download 'Legends of Zelda'",
    child: ElevatedButton.icon(
      onPressed: () => Navigator.pushNamed(context, '/resource/detail'),
      label: const Text("4.31 MB"),
      icon: const Icon(
        Icons.file_download_outlined,
        size: 22.0,
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

Widget downloadButtonIcon(context) {
  return Visibility(
    visible: context ? true : false,
    child: IconButton(
      onPressed: () => Navigator.pushNamed(context, '/resource/detail'),
      icon: const Icon(
        Icons.file_download_outlined,
        size: 22.0,
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
    return LayoutBuilder(builder: (context, constraints) {
      bool useHorizontalLayout = constraints.maxWidth < 1000;
      bool useVerticalLayout = constraints.maxWidth > 1000;
      bool useVerticalLayout2x = constraints.maxWidth > 580;
      bool useVerticalLayout3x = constraints.maxWidth > 460;

      int gridRowCount = 1;
      useVerticalLayout3x == true ? gridRowCount = 1 : null;
      useVerticalLayout2x == true ? gridRowCount = 2 : null;
      useVerticalLayout == true ? gridRowCount = 3 : null;

      return Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: true,
              centerTitle: false,
              backgroundColor: Colors.grey.shade200,
              surfaceTintColor: Colors.grey.shade200,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text('Resource'),
                  Visibility(
                    visible: useVerticalLayout ? true : false,
                    child: Flexible(
                      child: Padding(
                        padding: useVerticalLayout
                            ? const EdgeInsets.only(
                                top: 5.0, left: 150.0, right: 150.0)
                            : const EdgeInsets.only(
                                top: 5.0, left: 75.0, right: 75.0),
                        child: TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.search),
                            prefixIconConstraints:
                                const BoxConstraints(minWidth: 55.0),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                /* Clear the search field */
                              },
                            ),
                            suffixIconConstraints:
                                const BoxConstraints(minWidth: 55.0),
                            hintText: 'Search...',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 0.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      children: [
                        Visibility(
                          visible: useVerticalLayout3x ? true : false,
                          child: OutlinedButton.icon(
                            icon: const Icon(Icons.light_mode_rounded,
                                size: 20.0),
                            onPressed: null,
                            label: const Text('Light Mode'),
                          ),
                        ),
                        const IconButton(
                          icon: Icon(Icons.settings_outlined),
                          onPressed: null,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          body: Container(
              color: Colors.grey.shade200,
              child: Column(children: [
                Visibility(
                  visible: useVerticalLayout ? false : true,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, bottom: 12.0, left: 24.0, right: 24.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(
                              isDense: false,
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.search),
                              prefixIconConstraints:
                                  const BoxConstraints(minWidth: 55.0),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  /* Clear the search field */
                                },
                              ),
                              suffixIconConstraints:
                                  const BoxConstraints(minWidth: 55.0),
                              hintText: 'Search...',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 0.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              color: Colors.amber.shade100,
                            ),
                            child: IconButton(
                                tooltip: 'Grid Mode',
                                onPressed: () {},
                                icon: const Icon(Icons.grid_view_outlined)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: useVerticalLayout
                        ? const EdgeInsets.only(
                            bottom: 42.0, top: 12.0, left: 42.0, right: 42.0)
                        : const EdgeInsets.only(
                            bottom: 24.0, top: 6.0, left: 24.0, right: 24.0),
                    child: GridView.builder(
                        itemCount: images.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: useVerticalLayout2x ? 400 : 320,
                            crossAxisCount: gridRowCount,
                            crossAxisSpacing: useVerticalLayout ? 40.0 : 20.0,
                            mainAxisSpacing: 20.0),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onHover: ((value) =>
                                setState(() => selectedIndex = index)),
                            onTap: () => Navigator.pushNamed(
                                context, '/resource/detail'),
                            child: Card(
                                elevation: (selectedIndex == index) ? 1 : 0,
                                surfaceTintColor: Colors.green,
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceVariant,
                                shape: (selectedIndex == index)
                                    ? RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.green, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      )
                                    : null,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        child: Image(
                                            image: AssetImage(images[index]),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12.0,
                                                left: 20.0,
                                                right: 20.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Hello Cat',
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize:
                                                          useVerticalLayout2x
                                                              ? 24
                                                              : 18,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      letterSpacing: -1.0),
                                                ),
                                                Visibility(
                                                  visible: useVerticalLayout2x
                                                      ? true
                                                      : false,
                                                  child: Text(
                                                    timenow,
                                                    style: const TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Text(
                                            'Legends of Zelda',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: useVerticalLayout2x
                                                    ? 14
                                                    : 12,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10.0),
                                    ButtonBar(
                                      alignment: MainAxisAlignment.spaceBetween,
                                      buttonPadding: const EdgeInsets.all(20.0),
                                      children: [
                                        Chip(
                                            labelStyle: const TextStyle(
                                                color: Colors.black54,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                            label: const Text('Animal'),
                                            backgroundColor:
                                                Colors.grey.shade200,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            )),
                                        useVerticalLayout2x
                                            ? downloadButton(context)
                                            : downloadButtonIcon(
                                                useVerticalLayout3x),
                                      ],
                                    ),
                                  ],
                                )),
                          );
                        }),
                  ),
                ),
              ])));
    });
  }
}
