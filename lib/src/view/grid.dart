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
      bool useVerticalLayout = constraints.maxWidth > 1000;
      bool useVerticalLayout2x = constraints.maxWidth > 580;
      bool useVerticalLayout3x = constraints.maxWidth > 440;
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade200,
            surfaceTintColor: Colors.grey.shade200,
            title: const Text('Resource'),
          ),
          body: Container(
              color: Colors.grey.shade200,
              padding: EdgeInsets.all(useVerticalLayout ? 48.0 : 24),
              child: GridView.builder(
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: useVerticalLayout2x ? 400 : 320,
                      crossAxisCount: useVerticalLayout ? 3 : 2,
                      crossAxisSpacing: useVerticalLayout ? 40.0 : 20.0,
                      mainAxisSpacing: 20.0),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onHover: ((value) =>
                          setState(() => selectedIndex = index)),
                      onTap: () =>
                          Navigator.pushNamed(context, '/resource/detail'),
                      child: Card(
                          elevation: (selectedIndex == index) ? 1 : 0,
                          surfaceTintColor: Colors.green,
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          shape: (selectedIndex == index)
                              ? RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.green, width: 2),
                                  borderRadius: BorderRadius.circular(12.0),
                                )
                              : null,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image(
                                      image: AssetImage(images[index]),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12.0, left: 20.0, right: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Hello Cat',
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: useVerticalLayout2x
                                                    ? 24
                                                    : 18,
                                                fontWeight: FontWeight.w400,
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
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      'Legends of Zelda',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize:
                                              useVerticalLayout2x ? 14 : 12,
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
                                          fontWeight: FontWeight.w500),
                                      label: const Text('Animal'),
                                      backgroundColor: Colors.grey.shade200,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      )),
                                  useVerticalLayout2x
                                      ? downloadButton(context)
                                      : downloadButtonIcon(useVerticalLayout3x),
                                ],
                              ),
                            ],
                          )),
                    );
                  })));
    });
  }
}
