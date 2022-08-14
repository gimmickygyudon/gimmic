import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CardBig extends StatefulWidget {
  final BoxConstraints rowConstraints;
  final bool useVHideDetails;
  const CardBig(
      {super.key, required this.rowConstraints, required this.useVHideDetails});

  @override
  State<CardBig> createState() => _CardBigState();
}

class _CardBigState extends State<CardBig> {
  final String timecard = DateFormat("MMMM dd").format(DateTime.now());
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Colors.white, Colors.lightBlue],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white54,
      hoverColor: Colors.white12,
      highlightColor: Colors.white30,
      onTap: () {
        Navigator.pushNamed(context, '/resource');
      },
      child: Card(
        margin: const EdgeInsets.all(0.0),
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: widget.rowConstraints.maxWidth,
            maxHeight: 325.0,
          ),
          child: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/hellocat1.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  bottom: 20.0, left: 20.0, right: 20.0, top: 20.0),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.black.withAlpha(0),
                    Colors.black12,
                    Colors.black87
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      Visibility(
                        visible: widget.useVHideDetails ? false : true,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  size: 24.0,
                                  Icons.image_outlined,
                                  color: Colors.grey.shade200,
                                )),
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: Icon(
                                  size: 24.0,
                                  Icons.more_vert_rounded,
                                  color: Colors.grey.shade300,
                                )),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                            (states) {
                              return states.contains(MaterialState.hovered)
                                  ? Colors.white
                                  : Colors.black54;
                            },
                          ),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.orange.shade300),
                          /* minimumSize: MaterialStateProperty.all(
                                                                    const Size(220, 50)), */
                          elevation: const MaterialStatePropertyAll(0),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/resource');
                        },
                        child: Text("Get Started",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello Cat',
                                style: GoogleFonts.roboto(
                                  fontSize:
                                      widget.useVHideDetails ? 32.0 : 28.0,
                                  fontWeight: FontWeight.w600,
                                  foreground: Paint()..shader = linearGradient,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14.0, top: 8.0),
                                child: Text(
                                  timecard,
                                  style: GoogleFonts.roboto(
                                      fontSize:
                                          widget.useVHideDetails ? 14.0 : 12.0,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey.shade300),
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: widget.useVHideDetails ? true : false,
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    size: 24.0,
                                    Icons.image_outlined,
                                    color: Colors.grey.shade200,
                                  )),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: Icon(
                                    size: 24.0,
                                    Icons.more_vert_rounded,
                                    color: Colors.grey.shade100,
                                  ))
                            ]),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        "Welcome, You made it here! let's enjoy our time together",
                        style: GoogleFonts.roboto(
                            fontSize: widget.useVHideDetails ? 24.0 : 18.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
