import 'package:flutter/material.dart';

class GridResource extends StatefulWidget {
  const GridResource({super.key});

  @override
  State<GridResource> createState() => _GridResourceState();
}

int selectedIndex = -1;

List<String> images = [
  "images/hellocat.jpg",
  "images/hellocat1.jpg",
  "images/hellocat.jpg",
  "images/hellocat1.jpg"
];

class _GridResourceState extends State<GridResource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Resource'),
        ),
        body: Container(
            padding: const EdgeInsets.all(48.0),
            child: GridView.builder(
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 40.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (context, index) {
                  return Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 0,
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image(
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const Expanded(
                            child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Hello Cat',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -1.0),
                                )),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: ButtonBar(
                              alignment: MainAxisAlignment.end,
                              buttonPadding: const EdgeInsets.all(12.0),
                              children: [
                                ElevatedButton.icon(
                                  icon:
                                      const Icon(Icons.file_download_outlined),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green.shade100),
                                    foregroundColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) {
                                      return states
                                              .contains(MaterialState.hovered)
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
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/resource/view');
                                  },
                                  label: const Text("Download"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
                })));
  }
}
