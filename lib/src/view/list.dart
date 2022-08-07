import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListResource extends StatefulWidget {
  const ListResource({super.key});

  @override
  State<ListResource> createState() => _ListResourceState();
}

int selectedIndex = -1;
final String timenow = DateFormat("MMMM dd").format(DateTime.now());

List<String> images = [
  "images/hellocat.jpg",
  "images/hellocat1.jpg",
  "images/hellocat.jpg",
  "images/hellocat1.jpg"
];

class _ListResourceState extends State<ListResource> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 24.0, top: 6.0, left: 24.0, right: 24.0),
        child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return InkWell(
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
                    child: ListTile(
                      horizontalTitleGap: 20.0,
                      leading: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image(
                              image: AssetImage(images[index]),
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                      title: const Text(
                        'Hello Cat',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -1.0),
                      ),
                      subtitle: const Text(
                        'Legends of Zelda',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0),
                      ),
                      trailing: const Icon(Icons.more_vert),
                    )),
              );
            }),
      ),
    );
  }
}
