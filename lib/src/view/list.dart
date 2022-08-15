import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:intl/intl.dart';

class ListResource extends StatefulWidget {
  const ListResource({super.key});
=======
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ListResource extends StatefulWidget {
  final List<Map<String, dynamic>> foundResource;
  const ListResource({super.key, required this.foundResource});
>>>>>>> dev

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
<<<<<<< HEAD
            bottom: 24.0, top: 6.0, left: 24.0, right: 24.0),
=======
            bottom: 24.0, top: 6.0, left: 18.0, right: 18.0),
>>>>>>> dev
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
<<<<<<< HEAD
                      title: const Text(
                        'Hello Cat',
                        style: TextStyle(
=======
                      title: Text(
                        widget.foundResource[index]["name"].toString(),
                        style: GoogleFonts.roboto(
>>>>>>> dev
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -1.0),
                      ),
<<<<<<< HEAD
                      subtitle: const Text(
                        'Legends of Zelda',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0),
=======
                      subtitle: Text(
                        widget.foundResource[index]["subname"].toString(),
                        style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.0),
>>>>>>> dev
                      ),
                      trailing: const Icon(Icons.more_vert),
                    )),
              );
            }),
      ),
    );
  }
}
