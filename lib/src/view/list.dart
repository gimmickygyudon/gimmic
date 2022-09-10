import 'package:flutter/material.dart';
import 'package:gimmic/assets/functions/platform.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ListResource extends StatefulWidget {
  final List<Map<String, dynamic>> foundResource;
  const ListResource({super.key, required this.foundResource});

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
    return Padding(
      padding: const EdgeInsets.only(bottom: 24, top: 6, left: 18, right: 18),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return InkWell(
              onHover: ((value) => setState(() => selectedIndex = index)),
              onTap: () => context.pushNamed('details', params: {
                'name': widget.foundResource[index]['name'].toLowerCase(),
              }, extra: {
                "name": "${widget.foundResource[index]['name']}",
                "hero": "${widget.foundResource[index]['hero']}",
                "index": '${widget.foundResource[index]['index']}'
              }),
              child: Card(
                  elevation: (selectedIndex == index) ? 1 : 0,
                  surfaceTintColor: Colors.green,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  shape: (selectedIndex == index)
                      ? RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        )
                      : null,
                  child: ListTile(
                    contentPadding: isWebMobile
                        ? const EdgeInsets.symmetric(horizontal: 10)
                        : null,
                    leading: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Hero(
                          tag: widget.foundResource[index]["hero"] +
                              widget.foundResource[index]["index"].toString(),
                          child: Image(
                              image: AssetImage(images[index]),
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                    ),
                    title: Text(
                      widget.foundResource[index]["name"].toString(),
                      style: GoogleFonts.roboto(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -1),
                    ),
                    subtitle: Text(
                      widget.foundResource[index]["subname"].toString(),
                      style: GoogleFonts.roboto(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0),
                    ),
                    trailing: const Icon(Icons.more_vert),
                  )),
            );
          }),
    );
  }
}
